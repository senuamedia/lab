; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"ode_rhs"(i64 %t, i64 %y) nounwind {
entry:
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t22 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.2)
  %t23 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.3)
  %t24 = load i64, ptr %local.y
  %t25 = load i64, ptr %local.t
  %t26 = call i64 @"cos_f64"(i64 %t25)
  %t27 = call i64 @"sx_f64_sub"(i64 %t24, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t23, i64 %t27)
  %t29 = call i64 @"sx_f64_sub"(i64 %t22, i64 %t28)
  ret i64 %t29
}

define i64 @"exact_sol"(i64 %t) nounwind {
entry:
  %local.num.30 = alloca i64
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %t31 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.4)
  %t32 = load i64, ptr %local.t
  %t33 = call i64 @"cos_f64"(i64 %t32)
  %t34 = call i64 @"sx_f64_mul"(i64 %t31, i64 %t33)
  %t35 = load i64, ptr %local.t
  %t36 = call i64 @"sin_f64"(i64 %t35)
  %t37 = call i64 @"sx_f64_add"(i64 %t34, i64 %t36)
  %t38 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.5)
  %t39 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.6)
  %t40 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.7)
  %t41 = load i64, ptr %local.t
  %t42 = call i64 @"sx_f64_mul"(i64 %t40, i64 %t41)
  %t43 = call i64 @"sx_f64_sub"(i64 %t39, i64 %t42)
  %t44 = call i64 @"exp_f64"(i64 %t43)
  %t45 = call i64 @"sx_f64_mul"(i64 %t38, i64 %t44)
  %t46 = call i64 @"sx_f64_sub"(i64 %t37, i64 %t45)
  store i64 %t46, ptr %local.num.30
  %t47 = load i64, ptr %local.num.30
  %t48 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.8)
  %t49 = call i64 @"sx_f64_div"(i64 %t47, i64 %t48)
  ret i64 %t49
}

define i64 @"euler_step"(i64 %t, i64 %y, i64 %h) nounwind {
entry:
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %local.h = alloca i64
  store i64 %h, ptr %local.h
  %t50 = load i64, ptr %local.y
  %t51 = load i64, ptr %local.h
  %t52 = load i64, ptr %local.t
  %t53 = load i64, ptr %local.y
  %t54 = call i64 @"ode_rhs"(i64 %t52, i64 %t53)
  %t55 = call i64 @"sx_f64_mul"(i64 %t51, i64 %t54)
  %t56 = call i64 @"sx_f64_add"(i64 %t50, i64 %t55)
  ret i64 %t56
}

define i64 @"midpoint_step"(i64 %t, i64 %y, i64 %h) nounwind {
entry:
  %local.k1.57 = alloca i64
  %local.ymid.58 = alloca i64
  %local.tmid.59 = alloca i64
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %local.h = alloca i64
  store i64 %h, ptr %local.h
  %t60 = load i64, ptr %local.t
  %t61 = load i64, ptr %local.y
  %t62 = call i64 @"ode_rhs"(i64 %t60, i64 %t61)
  store i64 %t62, ptr %local.k1.57
  %t63 = load i64, ptr %local.y
  %t64 = load i64, ptr %local.h
  %t65 = load i64, ptr %local.k1.57
  %t66 = call i64 @"sx_f64_mul"(i64 %t64, i64 %t65)
  %t67 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.9)
  %t68 = call i64 @"sx_f64_div"(i64 %t66, i64 %t67)
  %t69 = call i64 @"sx_f64_add"(i64 %t63, i64 %t68)
  store i64 %t69, ptr %local.ymid.58
  %t70 = load i64, ptr %local.t
  %t71 = load i64, ptr %local.h
  %t72 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.10)
  %t73 = call i64 @"sx_f64_div"(i64 %t71, i64 %t72)
  %t74 = call i64 @"sx_f64_add"(i64 %t70, i64 %t73)
  store i64 %t74, ptr %local.tmid.59
  %t75 = load i64, ptr %local.y
  %t76 = load i64, ptr %local.h
  %t77 = load i64, ptr %local.tmid.59
  %t78 = load i64, ptr %local.ymid.58
  %t79 = call i64 @"ode_rhs"(i64 %t77, i64 %t78)
  %t80 = call i64 @"sx_f64_mul"(i64 %t76, i64 %t79)
  %t81 = call i64 @"sx_f64_add"(i64 %t75, i64 %t80)
  ret i64 %t81
}

define i64 @"rk4_step"(i64 %t, i64 %y, i64 %h) nounwind {
entry:
  %local.k1.82 = alloca i64
  %local.k2.83 = alloca i64
  %local.k3.84 = alloca i64
  %local.k4.85 = alloca i64
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %local.h = alloca i64
  store i64 %h, ptr %local.h
  %t86 = load i64, ptr %local.t
  %t87 = load i64, ptr %local.y
  %t88 = call i64 @"ode_rhs"(i64 %t86, i64 %t87)
  store i64 %t88, ptr %local.k1.82
  %t89 = load i64, ptr %local.t
  %t90 = load i64, ptr %local.h
  %t91 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.11)
  %t92 = call i64 @"sx_f64_div"(i64 %t90, i64 %t91)
  %t93 = call i64 @"sx_f64_add"(i64 %t89, i64 %t92)
  %t94 = load i64, ptr %local.y
  %t95 = load i64, ptr %local.h
  %t96 = load i64, ptr %local.k1.82
  %t97 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t96)
  %t98 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.12)
  %t99 = call i64 @"sx_f64_div"(i64 %t97, i64 %t98)
  %t100 = call i64 @"sx_f64_add"(i64 %t94, i64 %t99)
  %t101 = call i64 @"ode_rhs"(i64 %t93, i64 %t100)
  store i64 %t101, ptr %local.k2.83
  %t102 = load i64, ptr %local.t
  %t103 = load i64, ptr %local.h
  %t104 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.13)
  %t105 = call i64 @"sx_f64_div"(i64 %t103, i64 %t104)
  %t106 = call i64 @"sx_f64_add"(i64 %t102, i64 %t105)
  %t107 = load i64, ptr %local.y
  %t108 = load i64, ptr %local.h
  %t109 = load i64, ptr %local.k2.83
  %t110 = call i64 @"sx_f64_mul"(i64 %t108, i64 %t109)
  %t111 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.14)
  %t112 = call i64 @"sx_f64_div"(i64 %t110, i64 %t111)
  %t113 = call i64 @"sx_f64_add"(i64 %t107, i64 %t112)
  %t114 = call i64 @"ode_rhs"(i64 %t106, i64 %t113)
  store i64 %t114, ptr %local.k3.84
  %t115 = load i64, ptr %local.t
  %t116 = load i64, ptr %local.h
  %t117 = call i64 @"sx_f64_add"(i64 %t115, i64 %t116)
  %t118 = load i64, ptr %local.y
  %t119 = load i64, ptr %local.h
  %t120 = load i64, ptr %local.k3.84
  %t121 = call i64 @"sx_f64_mul"(i64 %t119, i64 %t120)
  %t122 = call i64 @"sx_f64_add"(i64 %t118, i64 %t121)
  %t123 = call i64 @"ode_rhs"(i64 %t117, i64 %t122)
  store i64 %t123, ptr %local.k4.85
  %t124 = load i64, ptr %local.y
  %t125 = load i64, ptr %local.h
  %t126 = load i64, ptr %local.k1.82
  %t127 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.15)
  %t128 = load i64, ptr %local.k2.83
  %t129 = call i64 @"sx_f64_mul"(i64 %t127, i64 %t128)
  %t130 = call i64 @"sx_f64_add"(i64 %t126, i64 %t129)
  %t131 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.16)
  %t132 = load i64, ptr %local.k3.84
  %t133 = call i64 @"sx_f64_mul"(i64 %t131, i64 %t132)
  %t134 = call i64 @"sx_f64_add"(i64 %t130, i64 %t133)
  %t135 = load i64, ptr %local.k4.85
  %t136 = call i64 @"sx_f64_add"(i64 %t134, i64 %t135)
  %t137 = call i64 @"sx_f64_mul"(i64 %t125, i64 %t136)
  %t138 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.17)
  %t139 = call i64 @"sx_f64_div"(i64 %t137, i64 %t138)
  %t140 = call i64 @"sx_f64_add"(i64 %t124, i64 %t139)
  ret i64 %t140
}

define i64 @"blend3"(i64 %y1, i64 %y2, i64 %y3, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.wsum.141 = alloca i64
  %local.y1 = alloca i64
  store i64 %y1, ptr %local.y1
  %local.y2 = alloca i64
  store i64 %y2, ptr %local.y2
  %local.y3 = alloca i64
  store i64 %y3, ptr %local.y3
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t142 = load i64, ptr %local.w1
  %t143 = load i64, ptr %local.w2
  %t144 = call i64 @"sx_f64_add"(i64 %t142, i64 %t143)
  %t145 = load i64, ptr %local.w3
  %t146 = call i64 @"sx_f64_add"(i64 %t144, i64 %t145)
  %t147 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.18)
  %t148 = call i64 @"sx_f64_add"(i64 %t146, i64 %t147)
  store i64 %t148, ptr %local.wsum.141
  %t149 = load i64, ptr %local.w1
  %t150 = load i64, ptr %local.y1
  %t151 = call i64 @"sx_f64_mul"(i64 %t149, i64 %t150)
  %t152 = load i64, ptr %local.w2
  %t153 = load i64, ptr %local.y2
  %t154 = call i64 @"sx_f64_mul"(i64 %t152, i64 %t153)
  %t155 = call i64 @"sx_f64_add"(i64 %t151, i64 %t154)
  %t156 = load i64, ptr %local.w3
  %t157 = load i64, ptr %local.y3
  %t158 = call i64 @"sx_f64_mul"(i64 %t156, i64 %t157)
  %t159 = call i64 @"sx_f64_add"(i64 %t155, i64 %t158)
  %t160 = load i64, ptr %local.wsum.141
  %t161 = call i64 @"sx_f64_div"(i64 %t159, i64 %t160)
  ret i64 %t161
}

define i64 @"integrate_err"(i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.t.162 = alloca i64
  %local.ye.163 = alloca i64
  %local.ym.164 = alloca i64
  %local.yr.165 = alloca i64
  %local.yb.166 = alloca i64
  %local.err_sum.167 = alloca i64
  %local.step.168 = alloca i64
  %local.h.169 = alloca i64
  %local.nsteps.170 = alloca i64
  %local.ne.171 = alloca i64
  %local.nm.172 = alloca i64
  %local.nr.173 = alloca i64
  %local.nb.174 = alloca i64
  %local.ex.175 = alloca i64
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t176 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.19)
  store i64 %t176, ptr %local.t.162
  %t177 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.20)
  store i64 %t177, ptr %local.ye.163
  %t178 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.21)
  store i64 %t178, ptr %local.ym.164
  %t179 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.22)
  store i64 %t179, ptr %local.yr.165
  %t180 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.23)
  store i64 %t180, ptr %local.yb.166
  %t181 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.24)
  store i64 %t181, ptr %local.err_sum.167
  store i64 0, ptr %local.step.168
  %t182 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.25)
  store i64 %t182, ptr %local.h.169
  store i64 200, ptr %local.nsteps.170
  br label %loop3
loop3:
  %t183 = load i64, ptr %local.step.168
  %t184 = load i64, ptr %local.nsteps.170
  %t185 = icmp slt i64 %t183, %t184
  %t186 = zext i1 %t185 to i64
  %t187 = icmp ne i64 %t186, 0
  br i1 %t187, label %body3, label %endloop3
body3:
  %t188 = load i64, ptr %local.t.162
  %t189 = load i64, ptr %local.ye.163
  %t190 = load i64, ptr %local.h.169
  %t191 = call i64 @"euler_step"(i64 %t188, i64 %t189, i64 %t190)
  store i64 %t191, ptr %local.ne.171
  %t192 = load i64, ptr %local.t.162
  %t193 = load i64, ptr %local.ym.164
  %t194 = load i64, ptr %local.h.169
  %t195 = call i64 @"midpoint_step"(i64 %t192, i64 %t193, i64 %t194)
  store i64 %t195, ptr %local.nm.172
  %t196 = load i64, ptr %local.t.162
  %t197 = load i64, ptr %local.yr.165
  %t198 = load i64, ptr %local.h.169
  %t199 = call i64 @"rk4_step"(i64 %t196, i64 %t197, i64 %t198)
  store i64 %t199, ptr %local.nr.173
  %t200 = load i64, ptr %local.ne.171
  %t201 = load i64, ptr %local.nm.172
  %t202 = load i64, ptr %local.nr.173
  %t203 = load i64, ptr %local.w1
  %t204 = load i64, ptr %local.w2
  %t205 = load i64, ptr %local.w3
  %t206 = call i64 @"blend3"(i64 %t200, i64 %t201, i64 %t202, i64 %t203, i64 %t204, i64 %t205)
  store i64 %t206, ptr %local.nb.174
  %t207 = load i64, ptr %local.ne.171
  store i64 %t207, ptr %local.ye.163
  %t208 = load i64, ptr %local.nm.172
  store i64 %t208, ptr %local.ym.164
  %t209 = load i64, ptr %local.nr.173
  store i64 %t209, ptr %local.yr.165
  %t210 = load i64, ptr %local.nb.174
  store i64 %t210, ptr %local.yb.166
  %t211 = load i64, ptr %local.t.162
  %t212 = load i64, ptr %local.h.169
  %t213 = call i64 @"sx_f64_add"(i64 %t211, i64 %t212)
  store i64 %t213, ptr %local.t.162
  %t214 = load i64, ptr %local.t.162
  %t215 = call i64 @"exact_sol"(i64 %t214)
  store i64 %t215, ptr %local.ex.175
  %t216 = load i64, ptr %local.err_sum.167
  %t217 = load i64, ptr %local.yb.166
  %t218 = load i64, ptr %local.ex.175
  %t219 = call i64 @"sx_f64_sub"(i64 %t217, i64 %t218)
  %t220 = call i64 @"abs_f64"(i64 %t219)
  %t221 = call i64 @"sx_f64_add"(i64 %t216, i64 %t220)
  store i64 %t221, ptr %local.err_sum.167
  %t222 = load i64, ptr %local.step.168
  %t223 = add i64 %t222, 1
  store i64 %t223, ptr %local.step.168
  br label %loop3
endloop3:
  %t224 = load i64, ptr %local.err_sum.167
  ret i64 %t224
}

define i64 @"solver_error"(i64 %which) nounwind {
entry:
  %local.t.225 = alloca i64
  %local.y.226 = alloca i64
  %local.err_sum.227 = alloca i64
  %local.step.228 = alloca i64
  %local.h.229 = alloca i64
  %local.nsteps.230 = alloca i64
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t231 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.26)
  store i64 %t231, ptr %local.t.225
  %t232 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.27)
  store i64 %t232, ptr %local.y.226
  %t233 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.28)
  store i64 %t233, ptr %local.err_sum.227
  store i64 0, ptr %local.step.228
  %t234 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.29)
  store i64 %t234, ptr %local.h.229
  store i64 200, ptr %local.nsteps.230
  br label %loop4
loop4:
  %t235 = load i64, ptr %local.step.228
  %t236 = load i64, ptr %local.nsteps.230
  %t237 = icmp slt i64 %t235, %t236
  %t238 = zext i1 %t237 to i64
  %t239 = icmp ne i64 %t238, 0
  br i1 %t239, label %body4, label %endloop4
body4:
  %t240 = load i64, ptr %local.which
  %t241 = icmp eq i64 %t240, 0
  %t242 = zext i1 %t241 to i64
  %t243 = icmp ne i64 %t242, 0
  br i1 %t243, label %then5, label %else5
then5:
  %t244 = load i64, ptr %local.t.225
  %t245 = load i64, ptr %local.y.226
  %t246 = load i64, ptr %local.h.229
  %t247 = call i64 @"euler_step"(i64 %t244, i64 %t245, i64 %t246)
  store i64 %t247, ptr %local.y.226
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t248 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t249 = load i64, ptr %local.which
  %t250 = icmp eq i64 %t249, 1
  %t251 = zext i1 %t250 to i64
  %t252 = icmp ne i64 %t251, 0
  br i1 %t252, label %then6, label %else6
then6:
  %t253 = load i64, ptr %local.t.225
  %t254 = load i64, ptr %local.y.226
  %t255 = load i64, ptr %local.h.229
  %t256 = call i64 @"midpoint_step"(i64 %t253, i64 %t254, i64 %t255)
  store i64 %t256, ptr %local.y.226
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t257 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t258 = load i64, ptr %local.which
  %t259 = icmp eq i64 %t258, 2
  %t260 = zext i1 %t259 to i64
  %t261 = icmp ne i64 %t260, 0
  br i1 %t261, label %then7, label %else7
then7:
  %t262 = load i64, ptr %local.t.225
  %t263 = load i64, ptr %local.y.226
  %t264 = load i64, ptr %local.h.229
  %t265 = call i64 @"rk4_step"(i64 %t262, i64 %t263, i64 %t264)
  store i64 %t265, ptr %local.y.226
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t266 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t267 = load i64, ptr %local.t.225
  %t268 = load i64, ptr %local.h.229
  %t269 = call i64 @"sx_f64_add"(i64 %t267, i64 %t268)
  store i64 %t269, ptr %local.t.225
  %t270 = load i64, ptr %local.err_sum.227
  %t271 = load i64, ptr %local.y.226
  %t272 = load i64, ptr %local.t.225
  %t273 = call i64 @"exact_sol"(i64 %t272)
  %t274 = call i64 @"sx_f64_sub"(i64 %t271, i64 %t273)
  %t275 = call i64 @"abs_f64"(i64 %t274)
  %t276 = call i64 @"sx_f64_add"(i64 %t270, i64 %t275)
  store i64 %t276, ptr %local.err_sum.227
  %t277 = load i64, ptr %local.step.228
  %t278 = add i64 %t277, 1
  store i64 %t278, ptr %local.step.228
  br label %loop4
endloop4:
  %t279 = load i64, ptr %local.err_sum.227
  ret i64 %t279
}

define i64 @"weight_grad"(i64 %w1, i64 %w2, i64 %w3, i64 %which) nounwind {
entry:
  %local.dh.280 = alloca i64
  %local.w1p.281 = alloca i64
  %local.w2p.282 = alloca i64
  %local.w3p.283 = alloca i64
  %local.w1m.284 = alloca i64
  %local.w2m.285 = alloca i64
  %local.w3m.286 = alloca i64
  %local.ep.287 = alloca i64
  %local.em.288 = alloca i64
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t289 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.30)
  store i64 %t289, ptr %local.dh.280
  %t290 = load i64, ptr %local.w1
  store i64 %t290, ptr %local.w1p.281
  %t291 = load i64, ptr %local.w2
  store i64 %t291, ptr %local.w2p.282
  %t292 = load i64, ptr %local.w3
  store i64 %t292, ptr %local.w3p.283
  %t293 = load i64, ptr %local.w1
  store i64 %t293, ptr %local.w1m.284
  %t294 = load i64, ptr %local.w2
  store i64 %t294, ptr %local.w2m.285
  %t295 = load i64, ptr %local.w3
  store i64 %t295, ptr %local.w3m.286
  %t296 = load i64, ptr %local.which
  %t297 = icmp eq i64 %t296, 0
  %t298 = zext i1 %t297 to i64
  %t299 = icmp ne i64 %t298, 0
  br i1 %t299, label %then8, label %else8
then8:
  %t300 = load i64, ptr %local.w1
  %t301 = load i64, ptr %local.dh.280
  %t302 = call i64 @"sx_f64_add"(i64 %t300, i64 %t301)
  store i64 %t302, ptr %local.w1p.281
  %t303 = load i64, ptr %local.w1
  %t304 = load i64, ptr %local.dh.280
  %t305 = call i64 @"sx_f64_sub"(i64 %t303, i64 %t304)
  store i64 %t305, ptr %local.w1m.284
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t306 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t307 = load i64, ptr %local.which
  %t308 = icmp eq i64 %t307, 1
  %t309 = zext i1 %t308 to i64
  %t310 = icmp ne i64 %t309, 0
  br i1 %t310, label %then9, label %else9
then9:
  %t311 = load i64, ptr %local.w2
  %t312 = load i64, ptr %local.dh.280
  %t313 = call i64 @"sx_f64_add"(i64 %t311, i64 %t312)
  store i64 %t313, ptr %local.w2p.282
  %t314 = load i64, ptr %local.w2
  %t315 = load i64, ptr %local.dh.280
  %t316 = call i64 @"sx_f64_sub"(i64 %t314, i64 %t315)
  store i64 %t316, ptr %local.w2m.285
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t317 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t318 = load i64, ptr %local.which
  %t319 = icmp eq i64 %t318, 2
  %t320 = zext i1 %t319 to i64
  %t321 = icmp ne i64 %t320, 0
  br i1 %t321, label %then10, label %else10
then10:
  %t322 = load i64, ptr %local.w3
  %t323 = load i64, ptr %local.dh.280
  %t324 = call i64 @"sx_f64_add"(i64 %t322, i64 %t323)
  store i64 %t324, ptr %local.w3p.283
  %t325 = load i64, ptr %local.w3
  %t326 = load i64, ptr %local.dh.280
  %t327 = call i64 @"sx_f64_sub"(i64 %t325, i64 %t326)
  store i64 %t327, ptr %local.w3m.286
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t328 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t329 = load i64, ptr %local.w1p.281
  %t330 = load i64, ptr %local.w2p.282
  %t331 = load i64, ptr %local.w3p.283
  %t332 = call i64 @"integrate_err"(i64 %t329, i64 %t330, i64 %t331)
  store i64 %t332, ptr %local.ep.287
  %t333 = load i64, ptr %local.w1m.284
  %t334 = load i64, ptr %local.w2m.285
  %t335 = load i64, ptr %local.w3m.286
  %t336 = call i64 @"integrate_err"(i64 %t333, i64 %t334, i64 %t335)
  store i64 %t336, ptr %local.em.288
  %t337 = load i64, ptr %local.ep.287
  %t338 = load i64, ptr %local.em.288
  %t339 = call i64 @"sx_f64_sub"(i64 %t337, i64 %t338)
  %t340 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.31)
  %t341 = load i64, ptr %local.dh.280
  %t342 = call i64 @"sx_f64_mul"(i64 %t340, i64 %t341)
  %t343 = call i64 @"sx_f64_div"(i64 %t339, i64 %t342)
  ret i64 %t343
}

define i64 @"region_error"(i64 %w1, i64 %w2, i64 %w3, i64 %t_start) nounwind {
entry:
  %local.t.344 = alloca i64
  %local.ye.345 = alloca i64
  %local.ym.346 = alloca i64
  %local.yr.347 = alloca i64
  %local.err_sum.348 = alloca i64
  %local.step.349 = alloca i64
  %local.h.350 = alloca i64
  %local.nsteps.351 = alloca i64
  %local.t_end.352 = alloca i64
  %local.ne.353 = alloca i64
  %local.nm.354 = alloca i64
  %local.nr.355 = alloca i64
  %local.nb.356 = alloca i64
  %local.ex.357 = alloca i64
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.t_start = alloca i64
  store i64 %t_start, ptr %local.t_start
  %t358 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.32)
  store i64 %t358, ptr %local.t.344
  %t359 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.33)
  store i64 %t359, ptr %local.ye.345
  %t360 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.34)
  store i64 %t360, ptr %local.ym.346
  %t361 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.35)
  store i64 %t361, ptr %local.yr.347
  %t362 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.36)
  store i64 %t362, ptr %local.err_sum.348
  store i64 0, ptr %local.step.349
  %t363 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.37)
  store i64 %t363, ptr %local.h.350
  store i64 200, ptr %local.nsteps.351
  %t364 = load i64, ptr %local.t_start
  %t365 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.38)
  %t366 = call i64 @"sx_f64_add"(i64 %t364, i64 %t365)
  store i64 %t366, ptr %local.t_end.352
  br label %loop11
loop11:
  %t367 = load i64, ptr %local.step.349
  %t368 = load i64, ptr %local.nsteps.351
  %t369 = icmp slt i64 %t367, %t368
  %t370 = zext i1 %t369 to i64
  %t371 = icmp ne i64 %t370, 0
  br i1 %t371, label %body11, label %endloop11
body11:
  %t372 = load i64, ptr %local.t.344
  %t373 = load i64, ptr %local.ye.345
  %t374 = load i64, ptr %local.h.350
  %t375 = call i64 @"euler_step"(i64 %t372, i64 %t373, i64 %t374)
  store i64 %t375, ptr %local.ne.353
  %t376 = load i64, ptr %local.t.344
  %t377 = load i64, ptr %local.ym.346
  %t378 = load i64, ptr %local.h.350
  %t379 = call i64 @"midpoint_step"(i64 %t376, i64 %t377, i64 %t378)
  store i64 %t379, ptr %local.nm.354
  %t380 = load i64, ptr %local.t.344
  %t381 = load i64, ptr %local.yr.347
  %t382 = load i64, ptr %local.h.350
  %t383 = call i64 @"rk4_step"(i64 %t380, i64 %t381, i64 %t382)
  store i64 %t383, ptr %local.nr.355
  %t384 = load i64, ptr %local.ne.353
  store i64 %t384, ptr %local.ye.345
  %t385 = load i64, ptr %local.nm.354
  store i64 %t385, ptr %local.ym.346
  %t386 = load i64, ptr %local.nr.355
  store i64 %t386, ptr %local.yr.347
  %t387 = load i64, ptr %local.t.344
  %t388 = load i64, ptr %local.h.350
  %t389 = call i64 @"sx_f64_add"(i64 %t387, i64 %t388)
  store i64 %t389, ptr %local.t.344
  %t390 = load i64, ptr %local.t.344
  %t391 = load i64, ptr %local.t_start
  %t392 = call i64 @"sx_f64_ge"(i64 %t390, i64 %t391)
  %t393 = icmp ne i64 %t392, 0
  br i1 %t393, label %then12, label %else12
then12:
  %t394 = load i64, ptr %local.t.344
  %t395 = load i64, ptr %local.t_end.352
  %t396 = call i64 @"sx_f64_le"(i64 %t394, i64 %t395)
  %t397 = icmp ne i64 %t396, 0
  br i1 %t397, label %then13, label %else13
then13:
  %t398 = load i64, ptr %local.ne.353
  %t399 = load i64, ptr %local.nm.354
  %t400 = load i64, ptr %local.nr.355
  %t401 = load i64, ptr %local.w1
  %t402 = load i64, ptr %local.w2
  %t403 = load i64, ptr %local.w3
  %t404 = call i64 @"blend3"(i64 %t398, i64 %t399, i64 %t400, i64 %t401, i64 %t402, i64 %t403)
  store i64 %t404, ptr %local.nb.356
  %t405 = load i64, ptr %local.t.344
  %t406 = call i64 @"exact_sol"(i64 %t405)
  store i64 %t406, ptr %local.ex.357
  %t407 = load i64, ptr %local.err_sum.348
  %t408 = load i64, ptr %local.nb.356
  %t409 = load i64, ptr %local.ex.357
  %t410 = call i64 @"sx_f64_sub"(i64 %t408, i64 %t409)
  %t411 = call i64 @"abs_f64"(i64 %t410)
  %t412 = call i64 @"sx_f64_add"(i64 %t407, i64 %t411)
  store i64 %t412, ptr %local.err_sum.348
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t413 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t414 = phi i64 [ %t413, %then12_end ], [ 0, %else12_end ]
  %t415 = load i64, ptr %local.step.349
  %t416 = add i64 %t415, 1
  store i64 %t416, ptr %local.step.349
  br label %loop11
endloop11:
  %t417 = load i64, ptr %local.err_sum.348
  ret i64 %t417
}

define i64 @"region_wgrad"(i64 %w1, i64 %w2, i64 %w3, i64 %which, i64 %t_start) nounwind {
entry:
  %local.dh.418 = alloca i64
  %local.w1p.419 = alloca i64
  %local.w2p.420 = alloca i64
  %local.w3p.421 = alloca i64
  %local.w1m.422 = alloca i64
  %local.w2m.423 = alloca i64
  %local.w3m.424 = alloca i64
  %local.ep.425 = alloca i64
  %local.em.426 = alloca i64
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.t_start = alloca i64
  store i64 %t_start, ptr %local.t_start
  %t427 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.39)
  store i64 %t427, ptr %local.dh.418
  %t428 = load i64, ptr %local.w1
  store i64 %t428, ptr %local.w1p.419
  %t429 = load i64, ptr %local.w2
  store i64 %t429, ptr %local.w2p.420
  %t430 = load i64, ptr %local.w3
  store i64 %t430, ptr %local.w3p.421
  %t431 = load i64, ptr %local.w1
  store i64 %t431, ptr %local.w1m.422
  %t432 = load i64, ptr %local.w2
  store i64 %t432, ptr %local.w2m.423
  %t433 = load i64, ptr %local.w3
  store i64 %t433, ptr %local.w3m.424
  %t434 = load i64, ptr %local.which
  %t435 = icmp eq i64 %t434, 0
  %t436 = zext i1 %t435 to i64
  %t437 = icmp ne i64 %t436, 0
  br i1 %t437, label %then14, label %else14
then14:
  %t438 = load i64, ptr %local.w1
  %t439 = load i64, ptr %local.dh.418
  %t440 = call i64 @"sx_f64_add"(i64 %t438, i64 %t439)
  store i64 %t440, ptr %local.w1p.419
  %t441 = load i64, ptr %local.w1
  %t442 = load i64, ptr %local.dh.418
  %t443 = call i64 @"sx_f64_sub"(i64 %t441, i64 %t442)
  store i64 %t443, ptr %local.w1m.422
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t444 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t445 = load i64, ptr %local.which
  %t446 = icmp eq i64 %t445, 1
  %t447 = zext i1 %t446 to i64
  %t448 = icmp ne i64 %t447, 0
  br i1 %t448, label %then15, label %else15
then15:
  %t449 = load i64, ptr %local.w2
  %t450 = load i64, ptr %local.dh.418
  %t451 = call i64 @"sx_f64_add"(i64 %t449, i64 %t450)
  store i64 %t451, ptr %local.w2p.420
  %t452 = load i64, ptr %local.w2
  %t453 = load i64, ptr %local.dh.418
  %t454 = call i64 @"sx_f64_sub"(i64 %t452, i64 %t453)
  store i64 %t454, ptr %local.w2m.423
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t455 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t456 = load i64, ptr %local.which
  %t457 = icmp eq i64 %t456, 2
  %t458 = zext i1 %t457 to i64
  %t459 = icmp ne i64 %t458, 0
  br i1 %t459, label %then16, label %else16
then16:
  %t460 = load i64, ptr %local.w3
  %t461 = load i64, ptr %local.dh.418
  %t462 = call i64 @"sx_f64_add"(i64 %t460, i64 %t461)
  store i64 %t462, ptr %local.w3p.421
  %t463 = load i64, ptr %local.w3
  %t464 = load i64, ptr %local.dh.418
  %t465 = call i64 @"sx_f64_sub"(i64 %t463, i64 %t464)
  store i64 %t465, ptr %local.w3m.424
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t466 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t467 = load i64, ptr %local.w1p.419
  %t468 = load i64, ptr %local.w2p.420
  %t469 = load i64, ptr %local.w3p.421
  %t470 = load i64, ptr %local.t_start
  %t471 = call i64 @"region_error"(i64 %t467, i64 %t468, i64 %t469, i64 %t470)
  store i64 %t471, ptr %local.ep.425
  %t472 = load i64, ptr %local.w1m.422
  %t473 = load i64, ptr %local.w2m.423
  %t474 = load i64, ptr %local.w3m.424
  %t475 = load i64, ptr %local.t_start
  %t476 = call i64 @"region_error"(i64 %t472, i64 %t473, i64 %t474, i64 %t475)
  store i64 %t476, ptr %local.em.426
  %t477 = load i64, ptr %local.ep.425
  %t478 = load i64, ptr %local.em.426
  %t479 = call i64 @"sx_f64_sub"(i64 %t477, i64 %t478)
  %t480 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.40)
  %t481 = load i64, ptr %local.dh.418
  %t482 = call i64 @"sx_f64_mul"(i64 %t480, i64 %t481)
  %t483 = call i64 @"sx_f64_div"(i64 %t479, i64 %t482)
  ret i64 %t483
}

define i64 @"learn_region"(i64 %t_start) nounwind {
entry:
  %local.w1.484 = alloca i64
  %local.w2.485 = alloca i64
  %local.w3.486 = alloca i64
  %local.cyc.487 = alloca i64
  %local.mg.488 = alloca i64
  %local.mlr.489 = alloca i64
  %local.norm.490 = alloca i64
  %local.t_start = alloca i64
  store i64 %t_start, ptr %local.t_start
  %t491 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.41)
  store i64 %t491, ptr %local.w1.484
  %t492 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.42)
  store i64 %t492, ptr %local.w2.485
  %t493 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.43)
  store i64 %t493, ptr %local.w3.486
  store i64 0, ptr %local.cyc.487
  %t494 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.44)
  store i64 %t494, ptr %local.mg.488
  %t495 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.45)
  store i64 %t495, ptr %local.mlr.489
  br label %loop17
loop17:
  %t496 = load i64, ptr %local.cyc.487
  %t497 = icmp slt i64 %t496, 30
  %t498 = zext i1 %t497 to i64
  %t499 = icmp ne i64 %t498, 0
  br i1 %t499, label %body17, label %endloop17
body17:
  %t500 = load i64, ptr %local.w1.484
  %t501 = load i64, ptr %local.w2.485
  %t502 = load i64, ptr %local.w3.486
  %t503 = load i64, ptr %local.t_start
  %t504 = call i64 @"region_wgrad"(i64 %t500, i64 %t501, i64 %t502, i64 0, i64 %t503)
  store i64 %t504, ptr %local.mg.488
  %t505 = load i64, ptr %local.w1.484
  %t506 = load i64, ptr %local.mlr.489
  %t507 = load i64, ptr %local.mg.488
  %t508 = call i64 @"sx_f64_mul"(i64 %t506, i64 %t507)
  %t509 = call i64 @"sx_f64_sub"(i64 %t505, i64 %t508)
  %t510 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.46)
  %t511 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.47)
  %t512 = call i64 @"clamp"(i64 %t509, i64 %t510, i64 %t511)
  store i64 %t512, ptr %local.w1.484
  %t513 = load i64, ptr %local.w1.484
  %t514 = load i64, ptr %local.w2.485
  %t515 = load i64, ptr %local.w3.486
  %t516 = load i64, ptr %local.t_start
  %t517 = call i64 @"region_wgrad"(i64 %t513, i64 %t514, i64 %t515, i64 1, i64 %t516)
  store i64 %t517, ptr %local.mg.488
  %t518 = load i64, ptr %local.w2.485
  %t519 = load i64, ptr %local.mlr.489
  %t520 = load i64, ptr %local.mg.488
  %t521 = call i64 @"sx_f64_mul"(i64 %t519, i64 %t520)
  %t522 = call i64 @"sx_f64_sub"(i64 %t518, i64 %t521)
  %t523 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.48)
  %t524 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.49)
  %t525 = call i64 @"clamp"(i64 %t522, i64 %t523, i64 %t524)
  store i64 %t525, ptr %local.w2.485
  %t526 = load i64, ptr %local.w1.484
  %t527 = load i64, ptr %local.w2.485
  %t528 = load i64, ptr %local.w3.486
  %t529 = load i64, ptr %local.t_start
  %t530 = call i64 @"region_wgrad"(i64 %t526, i64 %t527, i64 %t528, i64 2, i64 %t529)
  store i64 %t530, ptr %local.mg.488
  %t531 = load i64, ptr %local.w3.486
  %t532 = load i64, ptr %local.mlr.489
  %t533 = load i64, ptr %local.mg.488
  %t534 = call i64 @"sx_f64_mul"(i64 %t532, i64 %t533)
  %t535 = call i64 @"sx_f64_sub"(i64 %t531, i64 %t534)
  %t536 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.50)
  %t537 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.51)
  %t538 = call i64 @"clamp"(i64 %t535, i64 %t536, i64 %t537)
  store i64 %t538, ptr %local.w3.486
  %t539 = load i64, ptr %local.cyc.487
  %t540 = add i64 %t539, 1
  store i64 %t540, ptr %local.cyc.487
  br label %loop17
endloop17:
  %t541 = load i64, ptr %local.w1.484
  %t542 = load i64, ptr %local.w2.485
  %t543 = call i64 @"sx_f64_add"(i64 %t541, i64 %t542)
  %t544 = load i64, ptr %local.w3.486
  %t545 = call i64 @"sx_f64_add"(i64 %t543, i64 %t544)
  store i64 %t545, ptr %local.norm.490
  %t546 = load i64, ptr %local.w1.484
  %t547 = load i64, ptr %local.norm.490
  %t548 = call i64 @"sx_f64_div"(i64 %t546, i64 %t547)
  %t549 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.52)
  %t550 = call i64 @"sx_f64_mul"(i64 %t548, i64 %t549)
  %t551 = load i64, ptr %local.w2.485
  %t552 = load i64, ptr %local.norm.490
  %t553 = call i64 @"sx_f64_div"(i64 %t551, i64 %t552)
  %t554 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.53)
  %t555 = call i64 @"sx_f64_mul"(i64 %t553, i64 %t554)
  %t556 = call i64 @"sx_f64_add"(i64 %t550, i64 %t555)
  %t557 = load i64, ptr %local.w3.486
  %t558 = load i64, ptr %local.norm.490
  %t559 = call i64 @"sx_f64_div"(i64 %t557, i64 %t558)
  %t560 = call i64 @"sx_f64_add"(i64 %t556, i64 %t559)
  ret i64 %t560
}

define i64 @"decode_w1"(i64 %packed) nounwind {
entry:
  %local.raw.561 = alloca i64
  %local.w1f.562 = alloca i64
  %local.rem.563 = alloca i64
  %local.packed = alloca i64
  store i64 %packed, ptr %local.packed
  %t564 = load i64, ptr %local.packed
  %t565 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.54)
  %t566 = call i64 @"sx_f64_div"(i64 %t564, i64 %t565)
  store i64 %t566, ptr %local.raw.561
  %t567 = load i64, ptr %local.raw.561
  %t568 = load i64, ptr %local.raw.561
  %t569 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.55)
  %t570 = call i64 @"sx_f64_sub"(i64 %t568, i64 %t569)
  %t571 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.56)
  %t572 = call i64 @"sx_f64_mul"(i64 %t570, i64 %t571)
  %t573 = call i64 @"sx_f64_sub"(i64 %t567, i64 %t572)
  store i64 %t573, ptr %local.w1f.562
  %t574 = load i64, ptr %local.packed
  %t575 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.57)
  %t576 = load i64, ptr %local.raw.561
  %t577 = call i64 @"sx_f64_mul"(i64 %t575, i64 %t576)
  %t578 = call i64 @"sx_f64_sub"(i64 %t574, i64 %t577)
  store i64 %t578, ptr %local.rem.563
  %t579 = load i64, ptr %local.raw.561
  ret i64 %t579
}

define i64 @"solver_grad_cos"(i64 %t, i64 %y, i64 %h) nounwind {
entry:
  %local.ye.580 = alloca i64
  %local.ym.581 = alloca i64
  %local.yr.582 = alloca i64
  %local.ex.583 = alloca i64
  %local.ge.584 = alloca i64
  %local.gm.585 = alloca i64
  %local.gr.586 = alloca i64
  %local.c_em.587 = alloca i64
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %local.h = alloca i64
  store i64 %h, ptr %local.h
  %t588 = load i64, ptr %local.t
  %t589 = load i64, ptr %local.y
  %t590 = load i64, ptr %local.h
  %t591 = call i64 @"euler_step"(i64 %t588, i64 %t589, i64 %t590)
  store i64 %t591, ptr %local.ye.580
  %t592 = load i64, ptr %local.t
  %t593 = load i64, ptr %local.y
  %t594 = load i64, ptr %local.h
  %t595 = call i64 @"midpoint_step"(i64 %t592, i64 %t593, i64 %t594)
  store i64 %t595, ptr %local.ym.581
  %t596 = load i64, ptr %local.t
  %t597 = load i64, ptr %local.y
  %t598 = load i64, ptr %local.h
  %t599 = call i64 @"rk4_step"(i64 %t596, i64 %t597, i64 %t598)
  store i64 %t599, ptr %local.yr.582
  %t600 = load i64, ptr %local.t
  %t601 = load i64, ptr %local.h
  %t602 = call i64 @"sx_f64_add"(i64 %t600, i64 %t601)
  %t603 = call i64 @"exact_sol"(i64 %t602)
  store i64 %t603, ptr %local.ex.583
  %t604 = load i64, ptr %local.ye.580
  %t605 = load i64, ptr %local.ex.583
  %t606 = call i64 @"sx_f64_sub"(i64 %t604, i64 %t605)
  store i64 %t606, ptr %local.ge.584
  %t607 = load i64, ptr %local.ym.581
  %t608 = load i64, ptr %local.ex.583
  %t609 = call i64 @"sx_f64_sub"(i64 %t607, i64 %t608)
  store i64 %t609, ptr %local.gm.585
  %t610 = load i64, ptr %local.yr.582
  %t611 = load i64, ptr %local.ex.583
  %t612 = call i64 @"sx_f64_sub"(i64 %t610, i64 %t611)
  store i64 %t612, ptr %local.gr.586
  %t613 = load i64, ptr %local.ge.584
  %t614 = load i64, ptr %local.gm.585
  %t615 = call i64 @"sx_f64_mul"(i64 %t613, i64 %t614)
  %t616 = load i64, ptr %local.ge.584
  %t617 = call i64 @"abs_f64"(i64 %t616)
  %t618 = load i64, ptr %local.gm.585
  %t619 = call i64 @"abs_f64"(i64 %t618)
  %t620 = call i64 @"sx_f64_mul"(i64 %t617, i64 %t619)
  %t621 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.58)
  %t622 = call i64 @"sx_f64_add"(i64 %t620, i64 %t621)
  %t623 = call i64 @"sx_f64_div"(i64 %t615, i64 %t622)
  store i64 %t623, ptr %local.c_em.587
  %t624 = load i64, ptr %local.c_em.587
  ret i64 %t624
}

define i64 @"solver_variance"(i64 %ye, i64 %ym, i64 %yr) nounwind {
entry:
  %local.mean.625 = alloca i64
  %local.d1.626 = alloca i64
  %local.d2.627 = alloca i64
  %local.d3.628 = alloca i64
  %local.ye = alloca i64
  store i64 %ye, ptr %local.ye
  %local.ym = alloca i64
  store i64 %ym, ptr %local.ym
  %local.yr = alloca i64
  store i64 %yr, ptr %local.yr
  %t629 = load i64, ptr %local.ye
  %t630 = load i64, ptr %local.ym
  %t631 = call i64 @"sx_f64_add"(i64 %t629, i64 %t630)
  %t632 = load i64, ptr %local.yr
  %t633 = call i64 @"sx_f64_add"(i64 %t631, i64 %t632)
  %t634 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.59)
  %t635 = call i64 @"sx_f64_div"(i64 %t633, i64 %t634)
  store i64 %t635, ptr %local.mean.625
  %t636 = load i64, ptr %local.ye
  %t637 = load i64, ptr %local.mean.625
  %t638 = call i64 @"sx_f64_sub"(i64 %t636, i64 %t637)
  %t639 = load i64, ptr %local.ye
  %t640 = load i64, ptr %local.mean.625
  %t641 = call i64 @"sx_f64_sub"(i64 %t639, i64 %t640)
  %t642 = call i64 @"sx_f64_mul"(i64 %t638, i64 %t641)
  store i64 %t642, ptr %local.d1.626
  %t643 = load i64, ptr %local.ym
  %t644 = load i64, ptr %local.mean.625
  %t645 = call i64 @"sx_f64_sub"(i64 %t643, i64 %t644)
  %t646 = load i64, ptr %local.ym
  %t647 = load i64, ptr %local.mean.625
  %t648 = call i64 @"sx_f64_sub"(i64 %t646, i64 %t647)
  %t649 = call i64 @"sx_f64_mul"(i64 %t645, i64 %t648)
  store i64 %t649, ptr %local.d2.627
  %t650 = load i64, ptr %local.yr
  %t651 = load i64, ptr %local.mean.625
  %t652 = call i64 @"sx_f64_sub"(i64 %t650, i64 %t651)
  %t653 = load i64, ptr %local.yr
  %t654 = load i64, ptr %local.mean.625
  %t655 = call i64 @"sx_f64_sub"(i64 %t653, i64 %t654)
  %t656 = call i64 @"sx_f64_mul"(i64 %t652, i64 %t655)
  store i64 %t656, ptr %local.d3.628
  %t657 = load i64, ptr %local.d1.626
  %t658 = load i64, ptr %local.d2.627
  %t659 = call i64 @"sx_f64_add"(i64 %t657, i64 %t658)
  %t660 = load i64, ptr %local.d3.628
  %t661 = call i64 @"sx_f64_add"(i64 %t659, i64 %t660)
  %t662 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.60)
  %t663 = call i64 @"sx_f64_div"(i64 %t661, i64 %t662)
  ret i64 %t663
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.err_euler.664 = alloca i64
  %local.err_mid.665 = alloca i64
  %local.err_rk4.666 = alloca i64
  %local.err_equal.667 = alloca i64
  %local.w1.668 = alloca i64
  %local.w2.669 = alloca i64
  %local.w3.670 = alloca i64
  %local.cyc.671 = alloca i64
  %local.mg.672 = alloca i64
  %local.mlr.673 = alloca i64
  %local.err_c.674 = alloca i64
  %local.err_c.675 = alloca i64
  %local.err_c.676 = alloca i64
  %local.err_c.677 = alloca i64
  %local.err_learned.678 = alloca i64
  %local.wsum.679 = alloca i64
  %t680 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.61)
  %t681 = ptrtoint ptr %t680 to i64
  %t682 = inttoptr i64 %t681 to ptr
  call void @intrinsic_println(ptr %t682)
  %t683 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.62)
  %t684 = ptrtoint ptr %t683 to i64
  %t685 = inttoptr i64 %t684 to ptr
  call void @intrinsic_println(ptr %t685)
  %t686 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.63)
  %t687 = ptrtoint ptr %t686 to i64
  %t688 = inttoptr i64 %t687 to ptr
  call void @intrinsic_println(ptr %t688)
  %t689 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.64)
  %t690 = ptrtoint ptr %t689 to i64
  %t691 = inttoptr i64 %t690 to ptr
  call void @intrinsic_println(ptr %t691)
  %t692 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.65)
  %t693 = ptrtoint ptr %t692 to i64
  %t694 = inttoptr i64 %t693 to ptr
  call void @intrinsic_println(ptr %t694)
  %t695 = call i64 @"solver_error"(i64 0)
  store i64 %t695, ptr %local.err_euler.664
  %t696 = call i64 @"solver_error"(i64 1)
  store i64 %t696, ptr %local.err_mid.665
  %t697 = call i64 @"solver_error"(i64 2)
  store i64 %t697, ptr %local.err_rk4.666
  %t698 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.66)
  %t699 = ptrtoint ptr %t698 to i64
  %t700 = inttoptr i64 %t699 to ptr
  call void @intrinsic_print(ptr %t700)
  %t701 = load i64, ptr %local.err_euler.664
  %t702 = call i64 @"print_f64"(i64 %t701)
  %t703 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.67)
  %t704 = ptrtoint ptr %t703 to i64
  %t705 = inttoptr i64 %t704 to ptr
  call void @intrinsic_println(ptr %t705)
  %t706 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.68)
  %t707 = ptrtoint ptr %t706 to i64
  %t708 = inttoptr i64 %t707 to ptr
  call void @intrinsic_print(ptr %t708)
  %t709 = load i64, ptr %local.err_mid.665
  %t710 = call i64 @"print_f64"(i64 %t709)
  %t711 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.69)
  %t712 = ptrtoint ptr %t711 to i64
  %t713 = inttoptr i64 %t712 to ptr
  call void @intrinsic_println(ptr %t713)
  %t714 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.70)
  %t715 = ptrtoint ptr %t714 to i64
  %t716 = inttoptr i64 %t715 to ptr
  call void @intrinsic_print(ptr %t716)
  %t717 = load i64, ptr %local.err_rk4.666
  %t718 = call i64 @"print_f64"(i64 %t717)
  %t719 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.71)
  %t720 = ptrtoint ptr %t719 to i64
  %t721 = inttoptr i64 %t720 to ptr
  call void @intrinsic_println(ptr %t721)
  %t722 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.72)
  %t723 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.73)
  %t724 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.74)
  %t725 = call i64 @"integrate_err"(i64 %t722, i64 %t723, i64 %t724)
  store i64 %t725, ptr %local.err_equal.667
  %t726 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.75)
  %t727 = ptrtoint ptr %t726 to i64
  %t728 = inttoptr i64 %t727 to ptr
  call void @intrinsic_print(ptr %t728)
  %t729 = load i64, ptr %local.err_equal.667
  %t730 = call i64 @"print_f64"(i64 %t729)
  %t731 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.76)
  %t732 = ptrtoint ptr %t731 to i64
  %t733 = inttoptr i64 %t732 to ptr
  call void @intrinsic_println(ptr %t733)
  %t734 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.77)
  store i64 %t734, ptr %local.w1.668
  %t735 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.78)
  store i64 %t735, ptr %local.w2.669
  %t736 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.79)
  store i64 %t736, ptr %local.w3.670
  store i64 0, ptr %local.cyc.671
  %t737 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.80)
  store i64 %t737, ptr %local.mg.672
  %t738 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.81)
  store i64 %t738, ptr %local.mlr.673
  %t739 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.82)
  %t740 = ptrtoint ptr %t739 to i64
  %t741 = inttoptr i64 %t740 to ptr
  call void @intrinsic_println(ptr %t741)
  %t742 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.83)
  %t743 = ptrtoint ptr %t742 to i64
  %t744 = inttoptr i64 %t743 to ptr
  call void @intrinsic_println(ptr %t744)
  %t745 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.84)
  %t746 = ptrtoint ptr %t745 to i64
  %t747 = inttoptr i64 %t746 to ptr
  call void @intrinsic_println(ptr %t747)
  br label %loop18
loop18:
  %t748 = load i64, ptr %local.cyc.671
  %t749 = icmp slt i64 %t748, 40
  %t750 = zext i1 %t749 to i64
  %t751 = icmp ne i64 %t750, 0
  br i1 %t751, label %body18, label %endloop18
body18:
  %t752 = load i64, ptr %local.w1.668
  %t753 = load i64, ptr %local.w2.669
  %t754 = load i64, ptr %local.w3.670
  %t755 = call i64 @"weight_grad"(i64 %t752, i64 %t753, i64 %t754, i64 0)
  store i64 %t755, ptr %local.mg.672
  %t756 = load i64, ptr %local.w1.668
  %t757 = load i64, ptr %local.mlr.673
  %t758 = load i64, ptr %local.mg.672
  %t759 = call i64 @"sx_f64_mul"(i64 %t757, i64 %t758)
  %t760 = call i64 @"sx_f64_sub"(i64 %t756, i64 %t759)
  %t761 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.85)
  %t762 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.86)
  %t763 = call i64 @"clamp"(i64 %t760, i64 %t761, i64 %t762)
  store i64 %t763, ptr %local.w1.668
  %t764 = load i64, ptr %local.w1.668
  %t765 = load i64, ptr %local.w2.669
  %t766 = load i64, ptr %local.w3.670
  %t767 = call i64 @"weight_grad"(i64 %t764, i64 %t765, i64 %t766, i64 1)
  store i64 %t767, ptr %local.mg.672
  %t768 = load i64, ptr %local.w2.669
  %t769 = load i64, ptr %local.mlr.673
  %t770 = load i64, ptr %local.mg.672
  %t771 = call i64 @"sx_f64_mul"(i64 %t769, i64 %t770)
  %t772 = call i64 @"sx_f64_sub"(i64 %t768, i64 %t771)
  %t773 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.87)
  %t774 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.88)
  %t775 = call i64 @"clamp"(i64 %t772, i64 %t773, i64 %t774)
  store i64 %t775, ptr %local.w2.669
  %t776 = load i64, ptr %local.w1.668
  %t777 = load i64, ptr %local.w2.669
  %t778 = load i64, ptr %local.w3.670
  %t779 = call i64 @"weight_grad"(i64 %t776, i64 %t777, i64 %t778, i64 2)
  store i64 %t779, ptr %local.mg.672
  %t780 = load i64, ptr %local.w3.670
  %t781 = load i64, ptr %local.mlr.673
  %t782 = load i64, ptr %local.mg.672
  %t783 = call i64 @"sx_f64_mul"(i64 %t781, i64 %t782)
  %t784 = call i64 @"sx_f64_sub"(i64 %t780, i64 %t783)
  %t785 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.89)
  %t786 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.90)
  %t787 = call i64 @"clamp"(i64 %t784, i64 %t785, i64 %t786)
  store i64 %t787, ptr %local.w3.670
  %t788 = load i64, ptr %local.cyc.671
  %t789 = icmp slt i64 %t788, 3
  %t790 = zext i1 %t789 to i64
  %t791 = icmp ne i64 %t790, 0
  br i1 %t791, label %then19, label %else19
then19:
  %t792 = load i64, ptr %local.w1.668
  %t793 = load i64, ptr %local.w2.669
  %t794 = load i64, ptr %local.w3.670
  %t795 = call i64 @"integrate_err"(i64 %t792, i64 %t793, i64 %t794)
  store i64 %t795, ptr %local.err_c.674
  %t796 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.91)
  %t797 = ptrtoint ptr %t796 to i64
  %t798 = inttoptr i64 %t797 to ptr
  call void @intrinsic_print(ptr %t798)
  %t799 = load i64, ptr %local.cyc.671
  call void @print_i64(i64 %t799)
  %t800 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.92)
  %t801 = ptrtoint ptr %t800 to i64
  %t802 = inttoptr i64 %t801 to ptr
  call void @intrinsic_print(ptr %t802)
  %t803 = load i64, ptr %local.w1.668
  %t804 = call i64 @"print_f64"(i64 %t803)
  %t805 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.93)
  %t806 = ptrtoint ptr %t805 to i64
  %t807 = inttoptr i64 %t806 to ptr
  call void @intrinsic_print(ptr %t807)
  %t808 = load i64, ptr %local.w2.669
  %t809 = call i64 @"print_f64"(i64 %t808)
  %t810 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.94)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_print(ptr %t812)
  %t813 = load i64, ptr %local.w3.670
  %t814 = call i64 @"print_f64"(i64 %t813)
  %t815 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.95)
  %t816 = ptrtoint ptr %t815 to i64
  %t817 = inttoptr i64 %t816 to ptr
  call void @intrinsic_print(ptr %t817)
  %t818 = load i64, ptr %local.err_c.674
  %t819 = call i64 @"print_f64"(i64 %t818)
  %t820 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.96)
  %t821 = ptrtoint ptr %t820 to i64
  %t822 = inttoptr i64 %t821 to ptr
  call void @intrinsic_println(ptr %t822)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t823 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t824 = load i64, ptr %local.cyc.671
  %t825 = icmp eq i64 %t824, 9
  %t826 = zext i1 %t825 to i64
  %t827 = icmp ne i64 %t826, 0
  br i1 %t827, label %then20, label %else20
then20:
  %t828 = load i64, ptr %local.w1.668
  %t829 = load i64, ptr %local.w2.669
  %t830 = load i64, ptr %local.w3.670
  %t831 = call i64 @"integrate_err"(i64 %t828, i64 %t829, i64 %t830)
  store i64 %t831, ptr %local.err_c.675
  %t832 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.97)
  %t833 = ptrtoint ptr %t832 to i64
  %t834 = inttoptr i64 %t833 to ptr
  call void @intrinsic_print(ptr %t834)
  %t835 = load i64, ptr %local.w1.668
  %t836 = call i64 @"print_f64"(i64 %t835)
  %t837 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.98)
  %t838 = ptrtoint ptr %t837 to i64
  %t839 = inttoptr i64 %t838 to ptr
  call void @intrinsic_print(ptr %t839)
  %t840 = load i64, ptr %local.w2.669
  %t841 = call i64 @"print_f64"(i64 %t840)
  %t842 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.99)
  %t843 = ptrtoint ptr %t842 to i64
  %t844 = inttoptr i64 %t843 to ptr
  call void @intrinsic_print(ptr %t844)
  %t845 = load i64, ptr %local.w3.670
  %t846 = call i64 @"print_f64"(i64 %t845)
  %t847 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.100)
  %t848 = ptrtoint ptr %t847 to i64
  %t849 = inttoptr i64 %t848 to ptr
  call void @intrinsic_print(ptr %t849)
  %t850 = load i64, ptr %local.err_c.675
  %t851 = call i64 @"print_f64"(i64 %t850)
  %t852 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.101)
  %t853 = ptrtoint ptr %t852 to i64
  %t854 = inttoptr i64 %t853 to ptr
  call void @intrinsic_println(ptr %t854)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t855 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t856 = load i64, ptr %local.cyc.671
  %t857 = icmp eq i64 %t856, 19
  %t858 = zext i1 %t857 to i64
  %t859 = icmp ne i64 %t858, 0
  br i1 %t859, label %then21, label %else21
then21:
  %t860 = load i64, ptr %local.w1.668
  %t861 = load i64, ptr %local.w2.669
  %t862 = load i64, ptr %local.w3.670
  %t863 = call i64 @"integrate_err"(i64 %t860, i64 %t861, i64 %t862)
  store i64 %t863, ptr %local.err_c.676
  %t864 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.102)
  %t865 = ptrtoint ptr %t864 to i64
  %t866 = inttoptr i64 %t865 to ptr
  call void @intrinsic_print(ptr %t866)
  %t867 = load i64, ptr %local.w1.668
  %t868 = call i64 @"print_f64"(i64 %t867)
  %t869 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.103)
  %t870 = ptrtoint ptr %t869 to i64
  %t871 = inttoptr i64 %t870 to ptr
  call void @intrinsic_print(ptr %t871)
  %t872 = load i64, ptr %local.w2.669
  %t873 = call i64 @"print_f64"(i64 %t872)
  %t874 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.104)
  %t875 = ptrtoint ptr %t874 to i64
  %t876 = inttoptr i64 %t875 to ptr
  call void @intrinsic_print(ptr %t876)
  %t877 = load i64, ptr %local.w3.670
  %t878 = call i64 @"print_f64"(i64 %t877)
  %t879 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.105)
  %t880 = ptrtoint ptr %t879 to i64
  %t881 = inttoptr i64 %t880 to ptr
  call void @intrinsic_print(ptr %t881)
  %t882 = load i64, ptr %local.err_c.676
  %t883 = call i64 @"print_f64"(i64 %t882)
  %t884 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.106)
  %t885 = ptrtoint ptr %t884 to i64
  %t886 = inttoptr i64 %t885 to ptr
  call void @intrinsic_println(ptr %t886)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t887 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t888 = load i64, ptr %local.cyc.671
  %t889 = icmp eq i64 %t888, 39
  %t890 = zext i1 %t889 to i64
  %t891 = icmp ne i64 %t890, 0
  br i1 %t891, label %then22, label %else22
then22:
  %t892 = load i64, ptr %local.w1.668
  %t893 = load i64, ptr %local.w2.669
  %t894 = load i64, ptr %local.w3.670
  %t895 = call i64 @"integrate_err"(i64 %t892, i64 %t893, i64 %t894)
  store i64 %t895, ptr %local.err_c.677
  %t896 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.107)
  %t897 = ptrtoint ptr %t896 to i64
  %t898 = inttoptr i64 %t897 to ptr
  call void @intrinsic_print(ptr %t898)
  %t899 = load i64, ptr %local.w1.668
  %t900 = call i64 @"print_f64"(i64 %t899)
  %t901 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.108)
  %t902 = ptrtoint ptr %t901 to i64
  %t903 = inttoptr i64 %t902 to ptr
  call void @intrinsic_print(ptr %t903)
  %t904 = load i64, ptr %local.w2.669
  %t905 = call i64 @"print_f64"(i64 %t904)
  %t906 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.109)
  %t907 = ptrtoint ptr %t906 to i64
  %t908 = inttoptr i64 %t907 to ptr
  call void @intrinsic_print(ptr %t908)
  %t909 = load i64, ptr %local.w3.670
  %t910 = call i64 @"print_f64"(i64 %t909)
  %t911 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.110)
  %t912 = ptrtoint ptr %t911 to i64
  %t913 = inttoptr i64 %t912 to ptr
  call void @intrinsic_print(ptr %t913)
  %t914 = load i64, ptr %local.err_c.677
  %t915 = call i64 @"print_f64"(i64 %t914)
  %t916 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.111)
  %t917 = ptrtoint ptr %t916 to i64
  %t918 = inttoptr i64 %t917 to ptr
  call void @intrinsic_println(ptr %t918)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t919 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t920 = load i64, ptr %local.cyc.671
  %t921 = add i64 %t920, 1
  store i64 %t921, ptr %local.cyc.671
  br label %loop18
endloop18:
  %t922 = load i64, ptr %local.w1.668
  %t923 = load i64, ptr %local.w2.669
  %t924 = load i64, ptr %local.w3.670
  %t925 = call i64 @"integrate_err"(i64 %t922, i64 %t923, i64 %t924)
  store i64 %t925, ptr %local.err_learned.678
  %t926 = load i64, ptr %local.w1.668
  %t927 = load i64, ptr %local.w2.669
  %t928 = call i64 @"sx_f64_add"(i64 %t926, i64 %t927)
  %t929 = load i64, ptr %local.w3.670
  %t930 = call i64 @"sx_f64_add"(i64 %t928, i64 %t929)
  store i64 %t930, ptr %local.wsum.679
  %t931 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.112)
  %t932 = ptrtoint ptr %t931 to i64
  %t933 = inttoptr i64 %t932 to ptr
  call void @intrinsic_println(ptr %t933)
  %t934 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.113)
  %t935 = ptrtoint ptr %t934 to i64
  %t936 = inttoptr i64 %t935 to ptr
  call void @intrinsic_print(ptr %t936)
  %t937 = load i64, ptr %local.err_learned.678
  %t938 = call i64 @"print_f64"(i64 %t937)
  %t939 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.114)
  %t940 = ptrtoint ptr %t939 to i64
  %t941 = inttoptr i64 %t940 to ptr
  call void @intrinsic_println(ptr %t941)
  %t942 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.115)
  %t943 = ptrtoint ptr %t942 to i64
  %t944 = inttoptr i64 %t943 to ptr
  call void @intrinsic_print(ptr %t944)
  %t945 = load i64, ptr %local.w1.668
  %t946 = load i64, ptr %local.wsum.679
  %t947 = call i64 @"sx_f64_div"(i64 %t945, i64 %t946)
  %t948 = call i64 @"print_f64"(i64 %t947)
  %t949 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.116)
  %t950 = ptrtoint ptr %t949 to i64
  %t951 = inttoptr i64 %t950 to ptr
  call void @intrinsic_print(ptr %t951)
  %t952 = load i64, ptr %local.w2.669
  %t953 = load i64, ptr %local.wsum.679
  %t954 = call i64 @"sx_f64_div"(i64 %t952, i64 %t953)
  %t955 = call i64 @"print_f64"(i64 %t954)
  %t956 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.117)
  %t957 = ptrtoint ptr %t956 to i64
  %t958 = inttoptr i64 %t957 to ptr
  call void @intrinsic_print(ptr %t958)
  %t959 = load i64, ptr %local.w3.670
  %t960 = load i64, ptr %local.wsum.679
  %t961 = call i64 @"sx_f64_div"(i64 %t959, i64 %t960)
  %t962 = call i64 @"print_f64"(i64 %t961)
  %t963 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.118)
  %t964 = ptrtoint ptr %t963 to i64
  %t965 = inttoptr i64 %t964 to ptr
  call void @intrinsic_println(ptr %t965)
  %t966 = load i64, ptr %local.err_learned.678
  %t967 = load i64, ptr %local.err_equal.667
  %t968 = call i64 @"sx_f64_lt"(i64 %t966, i64 %t967)
  %t969 = icmp ne i64 %t968, 0
  br i1 %t969, label %then23, label %else23
then23:
  %t970 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.119)
  %t971 = ptrtoint ptr %t970 to i64
  %t972 = inttoptr i64 %t971 to ptr
  call void @intrinsic_println(ptr %t972)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t973 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.120)
  %t974 = ptrtoint ptr %t973 to i64
  %t975 = inttoptr i64 %t974 to ptr
  call void @intrinsic_println(ptr %t975)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t976 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t977 = load i64, ptr %local.err_learned.678
  %t978 = load i64, ptr %local.err_euler.664
  %t979 = call i64 @"sx_f64_lt"(i64 %t977, i64 %t978)
  %t980 = icmp ne i64 %t979, 0
  br i1 %t980, label %then24, label %else24
then24:
  %t981 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.121)
  %t982 = ptrtoint ptr %t981 to i64
  %t983 = inttoptr i64 %t982 to ptr
  call void @intrinsic_println(ptr %t983)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t984 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t985 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.122)
  %t986 = ptrtoint ptr %t985 to i64
  %t987 = inttoptr i64 %t986 to ptr
  call void @intrinsic_println(ptr %t987)
  ret i64 0
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.w1a.988 = alloca i64
  %local.w2a.989 = alloca i64
  %local.w3a.990 = alloca i64
  %local.cyc.991 = alloca i64
  %local.mg.992 = alloca i64
  %local.mlr.993 = alloca i64
  %local.sa.994 = alloca i64
  %local.w1b.995 = alloca i64
  %local.w2b.996 = alloca i64
  %local.w3b.997 = alloca i64
  %local.sb.998 = alloca i64
  %local.w1c.999 = alloca i64
  %local.w2c.1000 = alloca i64
  %local.w3c.1001 = alloca i64
  %local.sc.1002 = alloca i64
  %local.w1d.1003 = alloca i64
  %local.w2d.1004 = alloca i64
  %local.w3d.1005 = alloca i64
  %local.sd.1006 = alloca i64
  %local.rk4_early.1007 = alloca i64
  %local.rk4_late.1008 = alloca i64
  %local.euler_early.1009 = alloca i64
  %local.euler_late.1010 = alloca i64
  %t1011 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.123)
  %t1012 = ptrtoint ptr %t1011 to i64
  %t1013 = inttoptr i64 %t1012 to ptr
  call void @intrinsic_println(ptr %t1013)
  %t1014 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.124)
  %t1015 = ptrtoint ptr %t1014 to i64
  %t1016 = inttoptr i64 %t1015 to ptr
  call void @intrinsic_println(ptr %t1016)
  %t1017 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.125)
  %t1018 = ptrtoint ptr %t1017 to i64
  %t1019 = inttoptr i64 %t1018 to ptr
  call void @intrinsic_println(ptr %t1019)
  %t1020 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.126)
  %t1021 = ptrtoint ptr %t1020 to i64
  %t1022 = inttoptr i64 %t1021 to ptr
  call void @intrinsic_println(ptr %t1022)
  %t1023 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.127)
  %t1024 = ptrtoint ptr %t1023 to i64
  %t1025 = inttoptr i64 %t1024 to ptr
  call void @intrinsic_println(ptr %t1025)
  %t1026 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.128)
  %t1027 = ptrtoint ptr %t1026 to i64
  %t1028 = inttoptr i64 %t1027 to ptr
  call void @intrinsic_println(ptr %t1028)
  %t1029 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.129)
  %t1030 = ptrtoint ptr %t1029 to i64
  %t1031 = inttoptr i64 %t1030 to ptr
  call void @intrinsic_println(ptr %t1031)
  %t1032 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.130)
  store i64 %t1032, ptr %local.w1a.988
  %t1033 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.131)
  store i64 %t1033, ptr %local.w2a.989
  %t1034 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.132)
  store i64 %t1034, ptr %local.w3a.990
  store i64 0, ptr %local.cyc.991
  %t1035 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.133)
  store i64 %t1035, ptr %local.mg.992
  %t1036 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.134)
  store i64 %t1036, ptr %local.mlr.993
  br label %loop25
loop25:
  %t1037 = load i64, ptr %local.cyc.991
  %t1038 = icmp slt i64 %t1037, 30
  %t1039 = zext i1 %t1038 to i64
  %t1040 = icmp ne i64 %t1039, 0
  br i1 %t1040, label %body25, label %endloop25
body25:
  %t1041 = load i64, ptr %local.w1a.988
  %t1042 = load i64, ptr %local.w2a.989
  %t1043 = load i64, ptr %local.w3a.990
  %t1044 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.135)
  %t1045 = call i64 @"region_wgrad"(i64 %t1041, i64 %t1042, i64 %t1043, i64 0, i64 %t1044)
  store i64 %t1045, ptr %local.mg.992
  %t1046 = load i64, ptr %local.w1a.988
  %t1047 = load i64, ptr %local.mlr.993
  %t1048 = load i64, ptr %local.mg.992
  %t1049 = call i64 @"sx_f64_mul"(i64 %t1047, i64 %t1048)
  %t1050 = call i64 @"sx_f64_sub"(i64 %t1046, i64 %t1049)
  %t1051 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.136)
  %t1052 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.137)
  %t1053 = call i64 @"clamp"(i64 %t1050, i64 %t1051, i64 %t1052)
  store i64 %t1053, ptr %local.w1a.988
  %t1054 = load i64, ptr %local.w1a.988
  %t1055 = load i64, ptr %local.w2a.989
  %t1056 = load i64, ptr %local.w3a.990
  %t1057 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.138)
  %t1058 = call i64 @"region_wgrad"(i64 %t1054, i64 %t1055, i64 %t1056, i64 1, i64 %t1057)
  store i64 %t1058, ptr %local.mg.992
  %t1059 = load i64, ptr %local.w2a.989
  %t1060 = load i64, ptr %local.mlr.993
  %t1061 = load i64, ptr %local.mg.992
  %t1062 = call i64 @"sx_f64_mul"(i64 %t1060, i64 %t1061)
  %t1063 = call i64 @"sx_f64_sub"(i64 %t1059, i64 %t1062)
  %t1064 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.139)
  %t1065 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.140)
  %t1066 = call i64 @"clamp"(i64 %t1063, i64 %t1064, i64 %t1065)
  store i64 %t1066, ptr %local.w2a.989
  %t1067 = load i64, ptr %local.w1a.988
  %t1068 = load i64, ptr %local.w2a.989
  %t1069 = load i64, ptr %local.w3a.990
  %t1070 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.141)
  %t1071 = call i64 @"region_wgrad"(i64 %t1067, i64 %t1068, i64 %t1069, i64 2, i64 %t1070)
  store i64 %t1071, ptr %local.mg.992
  %t1072 = load i64, ptr %local.w3a.990
  %t1073 = load i64, ptr %local.mlr.993
  %t1074 = load i64, ptr %local.mg.992
  %t1075 = call i64 @"sx_f64_mul"(i64 %t1073, i64 %t1074)
  %t1076 = call i64 @"sx_f64_sub"(i64 %t1072, i64 %t1075)
  %t1077 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.142)
  %t1078 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.143)
  %t1079 = call i64 @"clamp"(i64 %t1076, i64 %t1077, i64 %t1078)
  store i64 %t1079, ptr %local.w3a.990
  %t1080 = load i64, ptr %local.cyc.991
  %t1081 = add i64 %t1080, 1
  store i64 %t1081, ptr %local.cyc.991
  br label %loop25
endloop25:
  %t1082 = load i64, ptr %local.w1a.988
  %t1083 = load i64, ptr %local.w2a.989
  %t1084 = call i64 @"sx_f64_add"(i64 %t1082, i64 %t1083)
  %t1085 = load i64, ptr %local.w3a.990
  %t1086 = call i64 @"sx_f64_add"(i64 %t1084, i64 %t1085)
  store i64 %t1086, ptr %local.sa.994
  %t1087 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.144)
  %t1088 = ptrtoint ptr %t1087 to i64
  %t1089 = inttoptr i64 %t1088 to ptr
  call void @intrinsic_print(ptr %t1089)
  %t1090 = load i64, ptr %local.w1a.988
  %t1091 = load i64, ptr %local.sa.994
  %t1092 = call i64 @"sx_f64_div"(i64 %t1090, i64 %t1091)
  %t1093 = call i64 @"print_f64"(i64 %t1092)
  %t1094 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.145)
  %t1095 = ptrtoint ptr %t1094 to i64
  %t1096 = inttoptr i64 %t1095 to ptr
  call void @intrinsic_print(ptr %t1096)
  %t1097 = load i64, ptr %local.w2a.989
  %t1098 = load i64, ptr %local.sa.994
  %t1099 = call i64 @"sx_f64_div"(i64 %t1097, i64 %t1098)
  %t1100 = call i64 @"print_f64"(i64 %t1099)
  %t1101 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.146)
  %t1102 = ptrtoint ptr %t1101 to i64
  %t1103 = inttoptr i64 %t1102 to ptr
  call void @intrinsic_print(ptr %t1103)
  %t1104 = load i64, ptr %local.w3a.990
  %t1105 = load i64, ptr %local.sa.994
  %t1106 = call i64 @"sx_f64_div"(i64 %t1104, i64 %t1105)
  %t1107 = call i64 @"print_f64"(i64 %t1106)
  %t1108 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.147)
  %t1109 = ptrtoint ptr %t1108 to i64
  %t1110 = inttoptr i64 %t1109 to ptr
  call void @intrinsic_println(ptr %t1110)
  %t1111 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.148)
  store i64 %t1111, ptr %local.w1b.995
  %t1112 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.149)
  store i64 %t1112, ptr %local.w2b.996
  %t1113 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.150)
  store i64 %t1113, ptr %local.w3b.997
  store i64 0, ptr %local.cyc.991
  br label %loop26
loop26:
  %t1114 = load i64, ptr %local.cyc.991
  %t1115 = icmp slt i64 %t1114, 30
  %t1116 = zext i1 %t1115 to i64
  %t1117 = icmp ne i64 %t1116, 0
  br i1 %t1117, label %body26, label %endloop26
body26:
  %t1118 = load i64, ptr %local.w1b.995
  %t1119 = load i64, ptr %local.w2b.996
  %t1120 = load i64, ptr %local.w3b.997
  %t1121 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.151)
  %t1122 = call i64 @"region_wgrad"(i64 %t1118, i64 %t1119, i64 %t1120, i64 0, i64 %t1121)
  store i64 %t1122, ptr %local.mg.992
  %t1123 = load i64, ptr %local.w1b.995
  %t1124 = load i64, ptr %local.mlr.993
  %t1125 = load i64, ptr %local.mg.992
  %t1126 = call i64 @"sx_f64_mul"(i64 %t1124, i64 %t1125)
  %t1127 = call i64 @"sx_f64_sub"(i64 %t1123, i64 %t1126)
  %t1128 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.152)
  %t1129 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.153)
  %t1130 = call i64 @"clamp"(i64 %t1127, i64 %t1128, i64 %t1129)
  store i64 %t1130, ptr %local.w1b.995
  %t1131 = load i64, ptr %local.w1b.995
  %t1132 = load i64, ptr %local.w2b.996
  %t1133 = load i64, ptr %local.w3b.997
  %t1134 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.154)
  %t1135 = call i64 @"region_wgrad"(i64 %t1131, i64 %t1132, i64 %t1133, i64 1, i64 %t1134)
  store i64 %t1135, ptr %local.mg.992
  %t1136 = load i64, ptr %local.w2b.996
  %t1137 = load i64, ptr %local.mlr.993
  %t1138 = load i64, ptr %local.mg.992
  %t1139 = call i64 @"sx_f64_mul"(i64 %t1137, i64 %t1138)
  %t1140 = call i64 @"sx_f64_sub"(i64 %t1136, i64 %t1139)
  %t1141 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.155)
  %t1142 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.156)
  %t1143 = call i64 @"clamp"(i64 %t1140, i64 %t1141, i64 %t1142)
  store i64 %t1143, ptr %local.w2b.996
  %t1144 = load i64, ptr %local.w1b.995
  %t1145 = load i64, ptr %local.w2b.996
  %t1146 = load i64, ptr %local.w3b.997
  %t1147 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.157)
  %t1148 = call i64 @"region_wgrad"(i64 %t1144, i64 %t1145, i64 %t1146, i64 2, i64 %t1147)
  store i64 %t1148, ptr %local.mg.992
  %t1149 = load i64, ptr %local.w3b.997
  %t1150 = load i64, ptr %local.mlr.993
  %t1151 = load i64, ptr %local.mg.992
  %t1152 = call i64 @"sx_f64_mul"(i64 %t1150, i64 %t1151)
  %t1153 = call i64 @"sx_f64_sub"(i64 %t1149, i64 %t1152)
  %t1154 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.158)
  %t1155 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.159)
  %t1156 = call i64 @"clamp"(i64 %t1153, i64 %t1154, i64 %t1155)
  store i64 %t1156, ptr %local.w3b.997
  %t1157 = load i64, ptr %local.cyc.991
  %t1158 = add i64 %t1157, 1
  store i64 %t1158, ptr %local.cyc.991
  br label %loop26
endloop26:
  %t1159 = load i64, ptr %local.w1b.995
  %t1160 = load i64, ptr %local.w2b.996
  %t1161 = call i64 @"sx_f64_add"(i64 %t1159, i64 %t1160)
  %t1162 = load i64, ptr %local.w3b.997
  %t1163 = call i64 @"sx_f64_add"(i64 %t1161, i64 %t1162)
  store i64 %t1163, ptr %local.sb.998
  %t1164 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.160)
  %t1165 = ptrtoint ptr %t1164 to i64
  %t1166 = inttoptr i64 %t1165 to ptr
  call void @intrinsic_print(ptr %t1166)
  %t1167 = load i64, ptr %local.w1b.995
  %t1168 = load i64, ptr %local.sb.998
  %t1169 = call i64 @"sx_f64_div"(i64 %t1167, i64 %t1168)
  %t1170 = call i64 @"print_f64"(i64 %t1169)
  %t1171 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.161)
  %t1172 = ptrtoint ptr %t1171 to i64
  %t1173 = inttoptr i64 %t1172 to ptr
  call void @intrinsic_print(ptr %t1173)
  %t1174 = load i64, ptr %local.w2b.996
  %t1175 = load i64, ptr %local.sb.998
  %t1176 = call i64 @"sx_f64_div"(i64 %t1174, i64 %t1175)
  %t1177 = call i64 @"print_f64"(i64 %t1176)
  %t1178 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.162)
  %t1179 = ptrtoint ptr %t1178 to i64
  %t1180 = inttoptr i64 %t1179 to ptr
  call void @intrinsic_print(ptr %t1180)
  %t1181 = load i64, ptr %local.w3b.997
  %t1182 = load i64, ptr %local.sb.998
  %t1183 = call i64 @"sx_f64_div"(i64 %t1181, i64 %t1182)
  %t1184 = call i64 @"print_f64"(i64 %t1183)
  %t1185 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.163)
  %t1186 = ptrtoint ptr %t1185 to i64
  %t1187 = inttoptr i64 %t1186 to ptr
  call void @intrinsic_println(ptr %t1187)
  %t1188 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.164)
  store i64 %t1188, ptr %local.w1c.999
  %t1189 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.165)
  store i64 %t1189, ptr %local.w2c.1000
  %t1190 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.166)
  store i64 %t1190, ptr %local.w3c.1001
  store i64 0, ptr %local.cyc.991
  br label %loop27
loop27:
  %t1191 = load i64, ptr %local.cyc.991
  %t1192 = icmp slt i64 %t1191, 30
  %t1193 = zext i1 %t1192 to i64
  %t1194 = icmp ne i64 %t1193, 0
  br i1 %t1194, label %body27, label %endloop27
body27:
  %t1195 = load i64, ptr %local.w1c.999
  %t1196 = load i64, ptr %local.w2c.1000
  %t1197 = load i64, ptr %local.w3c.1001
  %t1198 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.167)
  %t1199 = call i64 @"region_wgrad"(i64 %t1195, i64 %t1196, i64 %t1197, i64 0, i64 %t1198)
  store i64 %t1199, ptr %local.mg.992
  %t1200 = load i64, ptr %local.w1c.999
  %t1201 = load i64, ptr %local.mlr.993
  %t1202 = load i64, ptr %local.mg.992
  %t1203 = call i64 @"sx_f64_mul"(i64 %t1201, i64 %t1202)
  %t1204 = call i64 @"sx_f64_sub"(i64 %t1200, i64 %t1203)
  %t1205 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.168)
  %t1206 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.169)
  %t1207 = call i64 @"clamp"(i64 %t1204, i64 %t1205, i64 %t1206)
  store i64 %t1207, ptr %local.w1c.999
  %t1208 = load i64, ptr %local.w1c.999
  %t1209 = load i64, ptr %local.w2c.1000
  %t1210 = load i64, ptr %local.w3c.1001
  %t1211 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.170)
  %t1212 = call i64 @"region_wgrad"(i64 %t1208, i64 %t1209, i64 %t1210, i64 1, i64 %t1211)
  store i64 %t1212, ptr %local.mg.992
  %t1213 = load i64, ptr %local.w2c.1000
  %t1214 = load i64, ptr %local.mlr.993
  %t1215 = load i64, ptr %local.mg.992
  %t1216 = call i64 @"sx_f64_mul"(i64 %t1214, i64 %t1215)
  %t1217 = call i64 @"sx_f64_sub"(i64 %t1213, i64 %t1216)
  %t1218 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.171)
  %t1219 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.172)
  %t1220 = call i64 @"clamp"(i64 %t1217, i64 %t1218, i64 %t1219)
  store i64 %t1220, ptr %local.w2c.1000
  %t1221 = load i64, ptr %local.w1c.999
  %t1222 = load i64, ptr %local.w2c.1000
  %t1223 = load i64, ptr %local.w3c.1001
  %t1224 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.173)
  %t1225 = call i64 @"region_wgrad"(i64 %t1221, i64 %t1222, i64 %t1223, i64 2, i64 %t1224)
  store i64 %t1225, ptr %local.mg.992
  %t1226 = load i64, ptr %local.w3c.1001
  %t1227 = load i64, ptr %local.mlr.993
  %t1228 = load i64, ptr %local.mg.992
  %t1229 = call i64 @"sx_f64_mul"(i64 %t1227, i64 %t1228)
  %t1230 = call i64 @"sx_f64_sub"(i64 %t1226, i64 %t1229)
  %t1231 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.174)
  %t1232 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.175)
  %t1233 = call i64 @"clamp"(i64 %t1230, i64 %t1231, i64 %t1232)
  store i64 %t1233, ptr %local.w3c.1001
  %t1234 = load i64, ptr %local.cyc.991
  %t1235 = add i64 %t1234, 1
  store i64 %t1235, ptr %local.cyc.991
  br label %loop27
endloop27:
  %t1236 = load i64, ptr %local.w1c.999
  %t1237 = load i64, ptr %local.w2c.1000
  %t1238 = call i64 @"sx_f64_add"(i64 %t1236, i64 %t1237)
  %t1239 = load i64, ptr %local.w3c.1001
  %t1240 = call i64 @"sx_f64_add"(i64 %t1238, i64 %t1239)
  store i64 %t1240, ptr %local.sc.1002
  %t1241 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.176)
  %t1242 = ptrtoint ptr %t1241 to i64
  %t1243 = inttoptr i64 %t1242 to ptr
  call void @intrinsic_print(ptr %t1243)
  %t1244 = load i64, ptr %local.w1c.999
  %t1245 = load i64, ptr %local.sc.1002
  %t1246 = call i64 @"sx_f64_div"(i64 %t1244, i64 %t1245)
  %t1247 = call i64 @"print_f64"(i64 %t1246)
  %t1248 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.177)
  %t1249 = ptrtoint ptr %t1248 to i64
  %t1250 = inttoptr i64 %t1249 to ptr
  call void @intrinsic_print(ptr %t1250)
  %t1251 = load i64, ptr %local.w2c.1000
  %t1252 = load i64, ptr %local.sc.1002
  %t1253 = call i64 @"sx_f64_div"(i64 %t1251, i64 %t1252)
  %t1254 = call i64 @"print_f64"(i64 %t1253)
  %t1255 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.178)
  %t1256 = ptrtoint ptr %t1255 to i64
  %t1257 = inttoptr i64 %t1256 to ptr
  call void @intrinsic_print(ptr %t1257)
  %t1258 = load i64, ptr %local.w3c.1001
  %t1259 = load i64, ptr %local.sc.1002
  %t1260 = call i64 @"sx_f64_div"(i64 %t1258, i64 %t1259)
  %t1261 = call i64 @"print_f64"(i64 %t1260)
  %t1262 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.179)
  %t1263 = ptrtoint ptr %t1262 to i64
  %t1264 = inttoptr i64 %t1263 to ptr
  call void @intrinsic_println(ptr %t1264)
  %t1265 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.180)
  store i64 %t1265, ptr %local.w1d.1003
  %t1266 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.181)
  store i64 %t1266, ptr %local.w2d.1004
  %t1267 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.182)
  store i64 %t1267, ptr %local.w3d.1005
  store i64 0, ptr %local.cyc.991
  br label %loop28
loop28:
  %t1268 = load i64, ptr %local.cyc.991
  %t1269 = icmp slt i64 %t1268, 30
  %t1270 = zext i1 %t1269 to i64
  %t1271 = icmp ne i64 %t1270, 0
  br i1 %t1271, label %body28, label %endloop28
body28:
  %t1272 = load i64, ptr %local.w1d.1003
  %t1273 = load i64, ptr %local.w2d.1004
  %t1274 = load i64, ptr %local.w3d.1005
  %t1275 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.183)
  %t1276 = call i64 @"region_wgrad"(i64 %t1272, i64 %t1273, i64 %t1274, i64 0, i64 %t1275)
  store i64 %t1276, ptr %local.mg.992
  %t1277 = load i64, ptr %local.w1d.1003
  %t1278 = load i64, ptr %local.mlr.993
  %t1279 = load i64, ptr %local.mg.992
  %t1280 = call i64 @"sx_f64_mul"(i64 %t1278, i64 %t1279)
  %t1281 = call i64 @"sx_f64_sub"(i64 %t1277, i64 %t1280)
  %t1282 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.184)
  %t1283 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.185)
  %t1284 = call i64 @"clamp"(i64 %t1281, i64 %t1282, i64 %t1283)
  store i64 %t1284, ptr %local.w1d.1003
  %t1285 = load i64, ptr %local.w1d.1003
  %t1286 = load i64, ptr %local.w2d.1004
  %t1287 = load i64, ptr %local.w3d.1005
  %t1288 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.186)
  %t1289 = call i64 @"region_wgrad"(i64 %t1285, i64 %t1286, i64 %t1287, i64 1, i64 %t1288)
  store i64 %t1289, ptr %local.mg.992
  %t1290 = load i64, ptr %local.w2d.1004
  %t1291 = load i64, ptr %local.mlr.993
  %t1292 = load i64, ptr %local.mg.992
  %t1293 = call i64 @"sx_f64_mul"(i64 %t1291, i64 %t1292)
  %t1294 = call i64 @"sx_f64_sub"(i64 %t1290, i64 %t1293)
  %t1295 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.187)
  %t1296 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.188)
  %t1297 = call i64 @"clamp"(i64 %t1294, i64 %t1295, i64 %t1296)
  store i64 %t1297, ptr %local.w2d.1004
  %t1298 = load i64, ptr %local.w1d.1003
  %t1299 = load i64, ptr %local.w2d.1004
  %t1300 = load i64, ptr %local.w3d.1005
  %t1301 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.189)
  %t1302 = call i64 @"region_wgrad"(i64 %t1298, i64 %t1299, i64 %t1300, i64 2, i64 %t1301)
  store i64 %t1302, ptr %local.mg.992
  %t1303 = load i64, ptr %local.w3d.1005
  %t1304 = load i64, ptr %local.mlr.993
  %t1305 = load i64, ptr %local.mg.992
  %t1306 = call i64 @"sx_f64_mul"(i64 %t1304, i64 %t1305)
  %t1307 = call i64 @"sx_f64_sub"(i64 %t1303, i64 %t1306)
  %t1308 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.190)
  %t1309 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.191)
  %t1310 = call i64 @"clamp"(i64 %t1307, i64 %t1308, i64 %t1309)
  store i64 %t1310, ptr %local.w3d.1005
  %t1311 = load i64, ptr %local.cyc.991
  %t1312 = add i64 %t1311, 1
  store i64 %t1312, ptr %local.cyc.991
  br label %loop28
endloop28:
  %t1313 = load i64, ptr %local.w1d.1003
  %t1314 = load i64, ptr %local.w2d.1004
  %t1315 = call i64 @"sx_f64_add"(i64 %t1313, i64 %t1314)
  %t1316 = load i64, ptr %local.w3d.1005
  %t1317 = call i64 @"sx_f64_add"(i64 %t1315, i64 %t1316)
  store i64 %t1317, ptr %local.sd.1006
  %t1318 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.192)
  %t1319 = ptrtoint ptr %t1318 to i64
  %t1320 = inttoptr i64 %t1319 to ptr
  call void @intrinsic_print(ptr %t1320)
  %t1321 = load i64, ptr %local.w1d.1003
  %t1322 = load i64, ptr %local.sd.1006
  %t1323 = call i64 @"sx_f64_div"(i64 %t1321, i64 %t1322)
  %t1324 = call i64 @"print_f64"(i64 %t1323)
  %t1325 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.193)
  %t1326 = ptrtoint ptr %t1325 to i64
  %t1327 = inttoptr i64 %t1326 to ptr
  call void @intrinsic_print(ptr %t1327)
  %t1328 = load i64, ptr %local.w2d.1004
  %t1329 = load i64, ptr %local.sd.1006
  %t1330 = call i64 @"sx_f64_div"(i64 %t1328, i64 %t1329)
  %t1331 = call i64 @"print_f64"(i64 %t1330)
  %t1332 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.194)
  %t1333 = ptrtoint ptr %t1332 to i64
  %t1334 = inttoptr i64 %t1333 to ptr
  call void @intrinsic_print(ptr %t1334)
  %t1335 = load i64, ptr %local.w3d.1005
  %t1336 = load i64, ptr %local.sd.1006
  %t1337 = call i64 @"sx_f64_div"(i64 %t1335, i64 %t1336)
  %t1338 = call i64 @"print_f64"(i64 %t1337)
  %t1339 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.195)
  %t1340 = ptrtoint ptr %t1339 to i64
  %t1341 = inttoptr i64 %t1340 to ptr
  call void @intrinsic_println(ptr %t1341)
  %t1342 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.196)
  %t1343 = ptrtoint ptr %t1342 to i64
  %t1344 = inttoptr i64 %t1343 to ptr
  call void @intrinsic_println(ptr %t1344)
  %t1345 = load i64, ptr %local.w3a.990
  %t1346 = load i64, ptr %local.sa.994
  %t1347 = call i64 @"sx_f64_div"(i64 %t1345, i64 %t1346)
  store i64 %t1347, ptr %local.rk4_early.1007
  %t1348 = load i64, ptr %local.w3d.1005
  %t1349 = load i64, ptr %local.sd.1006
  %t1350 = call i64 @"sx_f64_div"(i64 %t1348, i64 %t1349)
  store i64 %t1350, ptr %local.rk4_late.1008
  %t1351 = load i64, ptr %local.w1a.988
  %t1352 = load i64, ptr %local.sa.994
  %t1353 = call i64 @"sx_f64_div"(i64 %t1351, i64 %t1352)
  store i64 %t1353, ptr %local.euler_early.1009
  %t1354 = load i64, ptr %local.w1d.1003
  %t1355 = load i64, ptr %local.sd.1006
  %t1356 = call i64 @"sx_f64_div"(i64 %t1354, i64 %t1355)
  store i64 %t1356, ptr %local.euler_late.1010
  %t1357 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.197)
  %t1358 = ptrtoint ptr %t1357 to i64
  %t1359 = inttoptr i64 %t1358 to ptr
  call void @intrinsic_print(ptr %t1359)
  %t1360 = load i64, ptr %local.rk4_early.1007
  %t1361 = call i64 @"print_f64"(i64 %t1360)
  %t1362 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.198)
  %t1363 = ptrtoint ptr %t1362 to i64
  %t1364 = inttoptr i64 %t1363 to ptr
  call void @intrinsic_print(ptr %t1364)
  %t1365 = load i64, ptr %local.rk4_late.1008
  %t1366 = call i64 @"print_f64"(i64 %t1365)
  %t1367 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.199)
  %t1368 = ptrtoint ptr %t1367 to i64
  %t1369 = inttoptr i64 %t1368 to ptr
  call void @intrinsic_println(ptr %t1369)
  %t1370 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.200)
  %t1371 = ptrtoint ptr %t1370 to i64
  %t1372 = inttoptr i64 %t1371 to ptr
  call void @intrinsic_print(ptr %t1372)
  %t1373 = load i64, ptr %local.euler_early.1009
  %t1374 = call i64 @"print_f64"(i64 %t1373)
  %t1375 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.201)
  %t1376 = ptrtoint ptr %t1375 to i64
  %t1377 = inttoptr i64 %t1376 to ptr
  call void @intrinsic_print(ptr %t1377)
  %t1378 = load i64, ptr %local.euler_late.1010
  %t1379 = call i64 @"print_f64"(i64 %t1378)
  %t1380 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.202)
  %t1381 = ptrtoint ptr %t1380 to i64
  %t1382 = inttoptr i64 %t1381 to ptr
  call void @intrinsic_println(ptr %t1382)
  %t1383 = load i64, ptr %local.rk4_early.1007
  %t1384 = load i64, ptr %local.rk4_late.1008
  %t1385 = call i64 @"sx_f64_gt"(i64 %t1383, i64 %t1384)
  %t1386 = icmp ne i64 %t1385, 0
  br i1 %t1386, label %then29, label %else29
then29:
  %t1387 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.203)
  %t1388 = ptrtoint ptr %t1387 to i64
  %t1389 = inttoptr i64 %t1388 to ptr
  call void @intrinsic_println(ptr %t1389)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t1390 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.204)
  %t1391 = ptrtoint ptr %t1390 to i64
  %t1392 = inttoptr i64 %t1391 to ptr
  call void @intrinsic_println(ptr %t1392)
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1393 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t1394 = load i64, ptr %local.euler_late.1010
  %t1395 = load i64, ptr %local.euler_early.1009
  %t1396 = call i64 @"sx_f64_gt"(i64 %t1394, i64 %t1395)
  %t1397 = icmp ne i64 %t1396, 0
  br i1 %t1397, label %then30, label %else30
then30:
  %t1398 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.205)
  %t1399 = ptrtoint ptr %t1398 to i64
  %t1400 = inttoptr i64 %t1399 to ptr
  call void @intrinsic_println(ptr %t1400)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t1401 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.206)
  %t1402 = ptrtoint ptr %t1401 to i64
  %t1403 = inttoptr i64 %t1402 to ptr
  call void @intrinsic_println(ptr %t1403)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1404 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1405 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.207)
  %t1406 = ptrtoint ptr %t1405 to i64
  %t1407 = inttoptr i64 %t1406 to ptr
  call void @intrinsic_println(ptr %t1407)
  ret i64 0
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.t.1408 = alloca i64
  %local.ye.1409 = alloca i64
  %local.ym.1410 = alloca i64
  %local.yr.1411 = alloca i64
  %local.step.1412 = alloca i64
  %local.h.1413 = alloca i64
  %local.cos_em_sum.1414 = alloca i64
  %local.cos_er_sum.1415 = alloca i64
  %local.cos_mr_sum.1416 = alloca i64
  %local.n_samples.1417 = alloca i64
  %local.ne.1418 = alloca i64
  %local.nm.1419 = alloca i64
  %local.nr.1420 = alloca i64
  %local.ex.1421 = alloca i64
  %local.ge.1422 = alloca i64
  %local.gm.1423 = alloca i64
  %local.gr.1424 = alloca i64
  %local.ae.1425 = alloca i64
  %local.am.1426 = alloca i64
  %local.ar.1427 = alloca i64
  %local.c_em.1428 = alloca i64
  %local.c_er.1429 = alloca i64
  %local.c_mr.1430 = alloca i64
  %local.agree.1431 = alloca i64
  %local.agree.1432 = alloca i64
  %local.agree.1433 = alloca i64
  %local.agree.1434 = alloca i64
  %local.agree.1435 = alloca i64
  %local.agree.1436 = alloca i64
  %local.avg_em.1437 = alloca i64
  %local.avg_er.1438 = alloca i64
  %local.avg_mr.1439 = alloca i64
  %t1440 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.208)
  %t1441 = ptrtoint ptr %t1440 to i64
  %t1442 = inttoptr i64 %t1441 to ptr
  call void @intrinsic_println(ptr %t1442)
  %t1443 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.209)
  %t1444 = ptrtoint ptr %t1443 to i64
  %t1445 = inttoptr i64 %t1444 to ptr
  call void @intrinsic_println(ptr %t1445)
  %t1446 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.210)
  %t1447 = ptrtoint ptr %t1446 to i64
  %t1448 = inttoptr i64 %t1447 to ptr
  call void @intrinsic_println(ptr %t1448)
  %t1449 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.211)
  %t1450 = ptrtoint ptr %t1449 to i64
  %t1451 = inttoptr i64 %t1450 to ptr
  call void @intrinsic_println(ptr %t1451)
  %t1452 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.212)
  %t1453 = ptrtoint ptr %t1452 to i64
  %t1454 = inttoptr i64 %t1453 to ptr
  call void @intrinsic_println(ptr %t1454)
  %t1455 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.213)
  store i64 %t1455, ptr %local.t.1408
  %t1456 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.214)
  store i64 %t1456, ptr %local.ye.1409
  %t1457 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.215)
  store i64 %t1457, ptr %local.ym.1410
  %t1458 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.216)
  store i64 %t1458, ptr %local.yr.1411
  store i64 0, ptr %local.step.1412
  %t1459 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.217)
  store i64 %t1459, ptr %local.h.1413
  %t1460 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.218)
  store i64 %t1460, ptr %local.cos_em_sum.1414
  %t1461 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.219)
  store i64 %t1461, ptr %local.cos_er_sum.1415
  %t1462 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.220)
  store i64 %t1462, ptr %local.cos_mr_sum.1416
  %t1463 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.221)
  store i64 %t1463, ptr %local.n_samples.1417
  %t1464 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.222)
  %t1465 = ptrtoint ptr %t1464 to i64
  %t1466 = inttoptr i64 %t1465 to ptr
  call void @intrinsic_println(ptr %t1466)
  %t1467 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.223)
  %t1468 = ptrtoint ptr %t1467 to i64
  %t1469 = inttoptr i64 %t1468 to ptr
  call void @intrinsic_println(ptr %t1469)
  br label %loop31
loop31:
  %t1470 = load i64, ptr %local.step.1412
  %t1471 = icmp slt i64 %t1470, 200
  %t1472 = zext i1 %t1471 to i64
  %t1473 = icmp ne i64 %t1472, 0
  br i1 %t1473, label %body31, label %endloop31
body31:
  %t1474 = load i64, ptr %local.t.1408
  %t1475 = load i64, ptr %local.ye.1409
  %t1476 = load i64, ptr %local.h.1413
  %t1477 = call i64 @"euler_step"(i64 %t1474, i64 %t1475, i64 %t1476)
  store i64 %t1477, ptr %local.ne.1418
  %t1478 = load i64, ptr %local.t.1408
  %t1479 = load i64, ptr %local.ym.1410
  %t1480 = load i64, ptr %local.h.1413
  %t1481 = call i64 @"midpoint_step"(i64 %t1478, i64 %t1479, i64 %t1480)
  store i64 %t1481, ptr %local.nm.1419
  %t1482 = load i64, ptr %local.t.1408
  %t1483 = load i64, ptr %local.yr.1411
  %t1484 = load i64, ptr %local.h.1413
  %t1485 = call i64 @"rk4_step"(i64 %t1482, i64 %t1483, i64 %t1484)
  store i64 %t1485, ptr %local.nr.1420
  %t1486 = load i64, ptr %local.ne.1418
  store i64 %t1486, ptr %local.ye.1409
  %t1487 = load i64, ptr %local.nm.1419
  store i64 %t1487, ptr %local.ym.1410
  %t1488 = load i64, ptr %local.nr.1420
  store i64 %t1488, ptr %local.yr.1411
  %t1489 = load i64, ptr %local.t.1408
  %t1490 = load i64, ptr %local.h.1413
  %t1491 = call i64 @"sx_f64_add"(i64 %t1489, i64 %t1490)
  store i64 %t1491, ptr %local.t.1408
  %t1492 = load i64, ptr %local.t.1408
  %t1493 = call i64 @"exact_sol"(i64 %t1492)
  store i64 %t1493, ptr %local.ex.1421
  %t1494 = load i64, ptr %local.ye.1409
  %t1495 = load i64, ptr %local.ex.1421
  %t1496 = call i64 @"sx_f64_sub"(i64 %t1494, i64 %t1495)
  store i64 %t1496, ptr %local.ge.1422
  %t1497 = load i64, ptr %local.ym.1410
  %t1498 = load i64, ptr %local.ex.1421
  %t1499 = call i64 @"sx_f64_sub"(i64 %t1497, i64 %t1498)
  store i64 %t1499, ptr %local.gm.1423
  %t1500 = load i64, ptr %local.yr.1411
  %t1501 = load i64, ptr %local.ex.1421
  %t1502 = call i64 @"sx_f64_sub"(i64 %t1500, i64 %t1501)
  store i64 %t1502, ptr %local.gr.1424
  %t1503 = load i64, ptr %local.ge.1422
  %t1504 = call i64 @"abs_f64"(i64 %t1503)
  %t1505 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.224)
  %t1506 = call i64 @"sx_f64_add"(i64 %t1504, i64 %t1505)
  store i64 %t1506, ptr %local.ae.1425
  %t1507 = load i64, ptr %local.gm.1423
  %t1508 = call i64 @"abs_f64"(i64 %t1507)
  %t1509 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.225)
  %t1510 = call i64 @"sx_f64_add"(i64 %t1508, i64 %t1509)
  store i64 %t1510, ptr %local.am.1426
  %t1511 = load i64, ptr %local.gr.1424
  %t1512 = call i64 @"abs_f64"(i64 %t1511)
  %t1513 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.226)
  %t1514 = call i64 @"sx_f64_add"(i64 %t1512, i64 %t1513)
  store i64 %t1514, ptr %local.ar.1427
  %t1515 = load i64, ptr %local.ge.1422
  %t1516 = load i64, ptr %local.gm.1423
  %t1517 = call i64 @"sx_f64_mul"(i64 %t1515, i64 %t1516)
  %t1518 = load i64, ptr %local.ae.1425
  %t1519 = load i64, ptr %local.am.1426
  %t1520 = call i64 @"sx_f64_mul"(i64 %t1518, i64 %t1519)
  %t1521 = call i64 @"sx_f64_div"(i64 %t1517, i64 %t1520)
  store i64 %t1521, ptr %local.c_em.1428
  %t1522 = load i64, ptr %local.ge.1422
  %t1523 = load i64, ptr %local.gr.1424
  %t1524 = call i64 @"sx_f64_mul"(i64 %t1522, i64 %t1523)
  %t1525 = load i64, ptr %local.ae.1425
  %t1526 = load i64, ptr %local.ar.1427
  %t1527 = call i64 @"sx_f64_mul"(i64 %t1525, i64 %t1526)
  %t1528 = call i64 @"sx_f64_div"(i64 %t1524, i64 %t1527)
  store i64 %t1528, ptr %local.c_er.1429
  %t1529 = load i64, ptr %local.gm.1423
  %t1530 = load i64, ptr %local.gr.1424
  %t1531 = call i64 @"sx_f64_mul"(i64 %t1529, i64 %t1530)
  %t1532 = load i64, ptr %local.am.1426
  %t1533 = load i64, ptr %local.ar.1427
  %t1534 = call i64 @"sx_f64_mul"(i64 %t1532, i64 %t1533)
  %t1535 = call i64 @"sx_f64_div"(i64 %t1531, i64 %t1534)
  store i64 %t1535, ptr %local.c_mr.1430
  %t1536 = load i64, ptr %local.cos_em_sum.1414
  %t1537 = load i64, ptr %local.c_em.1428
  %t1538 = call i64 @"sx_f64_add"(i64 %t1536, i64 %t1537)
  store i64 %t1538, ptr %local.cos_em_sum.1414
  %t1539 = load i64, ptr %local.cos_er_sum.1415
  %t1540 = load i64, ptr %local.c_er.1429
  %t1541 = call i64 @"sx_f64_add"(i64 %t1539, i64 %t1540)
  store i64 %t1541, ptr %local.cos_er_sum.1415
  %t1542 = load i64, ptr %local.cos_mr_sum.1416
  %t1543 = load i64, ptr %local.c_mr.1430
  %t1544 = call i64 @"sx_f64_add"(i64 %t1542, i64 %t1543)
  store i64 %t1544, ptr %local.cos_mr_sum.1416
  %t1545 = load i64, ptr %local.n_samples.1417
  %t1546 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.227)
  %t1547 = call i64 @"sx_f64_add"(i64 %t1545, i64 %t1546)
  store i64 %t1547, ptr %local.n_samples.1417
  %t1548 = load i64, ptr %local.step.1412
  %t1549 = icmp eq i64 %t1548, 4
  %t1550 = zext i1 %t1549 to i64
  %t1551 = icmp ne i64 %t1550, 0
  br i1 %t1551, label %then32, label %else32
then32:
  %t1552 = load i64, ptr %local.c_em.1428
  %t1553 = load i64, ptr %local.c_er.1429
  %t1554 = call i64 @"sx_f64_add"(i64 %t1552, i64 %t1553)
  %t1555 = load i64, ptr %local.c_mr.1430
  %t1556 = call i64 @"sx_f64_add"(i64 %t1554, i64 %t1555)
  %t1557 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.228)
  %t1558 = call i64 @"sx_f64_div"(i64 %t1556, i64 %t1557)
  store i64 %t1558, ptr %local.agree.1431
  %t1559 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.229)
  %t1560 = ptrtoint ptr %t1559 to i64
  %t1561 = inttoptr i64 %t1560 to ptr
  call void @intrinsic_print(ptr %t1561)
  %t1562 = load i64, ptr %local.c_em.1428
  %t1563 = call i64 @"print_f64"(i64 %t1562)
  %t1564 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.230)
  %t1565 = ptrtoint ptr %t1564 to i64
  %t1566 = inttoptr i64 %t1565 to ptr
  call void @intrinsic_print(ptr %t1566)
  %t1567 = load i64, ptr %local.c_er.1429
  %t1568 = call i64 @"print_f64"(i64 %t1567)
  %t1569 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.231)
  %t1570 = ptrtoint ptr %t1569 to i64
  %t1571 = inttoptr i64 %t1570 to ptr
  call void @intrinsic_print(ptr %t1571)
  %t1572 = load i64, ptr %local.c_mr.1430
  %t1573 = call i64 @"print_f64"(i64 %t1572)
  %t1574 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.232)
  %t1575 = ptrtoint ptr %t1574 to i64
  %t1576 = inttoptr i64 %t1575 to ptr
  call void @intrinsic_print(ptr %t1576)
  %t1577 = load i64, ptr %local.agree.1431
  %t1578 = call i64 @"print_f64"(i64 %t1577)
  %t1579 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.233)
  %t1580 = ptrtoint ptr %t1579 to i64
  %t1581 = inttoptr i64 %t1580 to ptr
  call void @intrinsic_println(ptr %t1581)
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1582 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1583 = load i64, ptr %local.step.1412
  %t1584 = icmp eq i64 %t1583, 24
  %t1585 = zext i1 %t1584 to i64
  %t1586 = icmp ne i64 %t1585, 0
  br i1 %t1586, label %then33, label %else33
then33:
  %t1587 = load i64, ptr %local.c_em.1428
  %t1588 = load i64, ptr %local.c_er.1429
  %t1589 = call i64 @"sx_f64_add"(i64 %t1587, i64 %t1588)
  %t1590 = load i64, ptr %local.c_mr.1430
  %t1591 = call i64 @"sx_f64_add"(i64 %t1589, i64 %t1590)
  %t1592 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.234)
  %t1593 = call i64 @"sx_f64_div"(i64 %t1591, i64 %t1592)
  store i64 %t1593, ptr %local.agree.1432
  %t1594 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.235)
  %t1595 = ptrtoint ptr %t1594 to i64
  %t1596 = inttoptr i64 %t1595 to ptr
  call void @intrinsic_print(ptr %t1596)
  %t1597 = load i64, ptr %local.c_em.1428
  %t1598 = call i64 @"print_f64"(i64 %t1597)
  %t1599 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.236)
  %t1600 = ptrtoint ptr %t1599 to i64
  %t1601 = inttoptr i64 %t1600 to ptr
  call void @intrinsic_print(ptr %t1601)
  %t1602 = load i64, ptr %local.c_er.1429
  %t1603 = call i64 @"print_f64"(i64 %t1602)
  %t1604 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.237)
  %t1605 = ptrtoint ptr %t1604 to i64
  %t1606 = inttoptr i64 %t1605 to ptr
  call void @intrinsic_print(ptr %t1606)
  %t1607 = load i64, ptr %local.c_mr.1430
  %t1608 = call i64 @"print_f64"(i64 %t1607)
  %t1609 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.238)
  %t1610 = ptrtoint ptr %t1609 to i64
  %t1611 = inttoptr i64 %t1610 to ptr
  call void @intrinsic_print(ptr %t1611)
  %t1612 = load i64, ptr %local.agree.1432
  %t1613 = call i64 @"print_f64"(i64 %t1612)
  %t1614 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.239)
  %t1615 = ptrtoint ptr %t1614 to i64
  %t1616 = inttoptr i64 %t1615 to ptr
  call void @intrinsic_println(ptr %t1616)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1617 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1618 = load i64, ptr %local.step.1412
  %t1619 = icmp eq i64 %t1618, 49
  %t1620 = zext i1 %t1619 to i64
  %t1621 = icmp ne i64 %t1620, 0
  br i1 %t1621, label %then34, label %else34
then34:
  %t1622 = load i64, ptr %local.c_em.1428
  %t1623 = load i64, ptr %local.c_er.1429
  %t1624 = call i64 @"sx_f64_add"(i64 %t1622, i64 %t1623)
  %t1625 = load i64, ptr %local.c_mr.1430
  %t1626 = call i64 @"sx_f64_add"(i64 %t1624, i64 %t1625)
  %t1627 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.240)
  %t1628 = call i64 @"sx_f64_div"(i64 %t1626, i64 %t1627)
  store i64 %t1628, ptr %local.agree.1433
  %t1629 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.241)
  %t1630 = ptrtoint ptr %t1629 to i64
  %t1631 = inttoptr i64 %t1630 to ptr
  call void @intrinsic_print(ptr %t1631)
  %t1632 = load i64, ptr %local.c_em.1428
  %t1633 = call i64 @"print_f64"(i64 %t1632)
  %t1634 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.242)
  %t1635 = ptrtoint ptr %t1634 to i64
  %t1636 = inttoptr i64 %t1635 to ptr
  call void @intrinsic_print(ptr %t1636)
  %t1637 = load i64, ptr %local.c_er.1429
  %t1638 = call i64 @"print_f64"(i64 %t1637)
  %t1639 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.243)
  %t1640 = ptrtoint ptr %t1639 to i64
  %t1641 = inttoptr i64 %t1640 to ptr
  call void @intrinsic_print(ptr %t1641)
  %t1642 = load i64, ptr %local.c_mr.1430
  %t1643 = call i64 @"print_f64"(i64 %t1642)
  %t1644 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.244)
  %t1645 = ptrtoint ptr %t1644 to i64
  %t1646 = inttoptr i64 %t1645 to ptr
  call void @intrinsic_print(ptr %t1646)
  %t1647 = load i64, ptr %local.agree.1433
  %t1648 = call i64 @"print_f64"(i64 %t1647)
  %t1649 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.245)
  %t1650 = ptrtoint ptr %t1649 to i64
  %t1651 = inttoptr i64 %t1650 to ptr
  call void @intrinsic_println(ptr %t1651)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1652 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1653 = load i64, ptr %local.step.1412
  %t1654 = icmp eq i64 %t1653, 99
  %t1655 = zext i1 %t1654 to i64
  %t1656 = icmp ne i64 %t1655, 0
  br i1 %t1656, label %then35, label %else35
then35:
  %t1657 = load i64, ptr %local.c_em.1428
  %t1658 = load i64, ptr %local.c_er.1429
  %t1659 = call i64 @"sx_f64_add"(i64 %t1657, i64 %t1658)
  %t1660 = load i64, ptr %local.c_mr.1430
  %t1661 = call i64 @"sx_f64_add"(i64 %t1659, i64 %t1660)
  %t1662 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.246)
  %t1663 = call i64 @"sx_f64_div"(i64 %t1661, i64 %t1662)
  store i64 %t1663, ptr %local.agree.1434
  %t1664 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.247)
  %t1665 = ptrtoint ptr %t1664 to i64
  %t1666 = inttoptr i64 %t1665 to ptr
  call void @intrinsic_print(ptr %t1666)
  %t1667 = load i64, ptr %local.c_em.1428
  %t1668 = call i64 @"print_f64"(i64 %t1667)
  %t1669 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.248)
  %t1670 = ptrtoint ptr %t1669 to i64
  %t1671 = inttoptr i64 %t1670 to ptr
  call void @intrinsic_print(ptr %t1671)
  %t1672 = load i64, ptr %local.c_er.1429
  %t1673 = call i64 @"print_f64"(i64 %t1672)
  %t1674 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.249)
  %t1675 = ptrtoint ptr %t1674 to i64
  %t1676 = inttoptr i64 %t1675 to ptr
  call void @intrinsic_print(ptr %t1676)
  %t1677 = load i64, ptr %local.c_mr.1430
  %t1678 = call i64 @"print_f64"(i64 %t1677)
  %t1679 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.250)
  %t1680 = ptrtoint ptr %t1679 to i64
  %t1681 = inttoptr i64 %t1680 to ptr
  call void @intrinsic_print(ptr %t1681)
  %t1682 = load i64, ptr %local.agree.1434
  %t1683 = call i64 @"print_f64"(i64 %t1682)
  %t1684 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.251)
  %t1685 = ptrtoint ptr %t1684 to i64
  %t1686 = inttoptr i64 %t1685 to ptr
  call void @intrinsic_println(ptr %t1686)
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1687 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1688 = load i64, ptr %local.step.1412
  %t1689 = icmp eq i64 %t1688, 149
  %t1690 = zext i1 %t1689 to i64
  %t1691 = icmp ne i64 %t1690, 0
  br i1 %t1691, label %then36, label %else36
then36:
  %t1692 = load i64, ptr %local.c_em.1428
  %t1693 = load i64, ptr %local.c_er.1429
  %t1694 = call i64 @"sx_f64_add"(i64 %t1692, i64 %t1693)
  %t1695 = load i64, ptr %local.c_mr.1430
  %t1696 = call i64 @"sx_f64_add"(i64 %t1694, i64 %t1695)
  %t1697 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.252)
  %t1698 = call i64 @"sx_f64_div"(i64 %t1696, i64 %t1697)
  store i64 %t1698, ptr %local.agree.1435
  %t1699 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.253)
  %t1700 = ptrtoint ptr %t1699 to i64
  %t1701 = inttoptr i64 %t1700 to ptr
  call void @intrinsic_print(ptr %t1701)
  %t1702 = load i64, ptr %local.c_em.1428
  %t1703 = call i64 @"print_f64"(i64 %t1702)
  %t1704 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.254)
  %t1705 = ptrtoint ptr %t1704 to i64
  %t1706 = inttoptr i64 %t1705 to ptr
  call void @intrinsic_print(ptr %t1706)
  %t1707 = load i64, ptr %local.c_er.1429
  %t1708 = call i64 @"print_f64"(i64 %t1707)
  %t1709 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.255)
  %t1710 = ptrtoint ptr %t1709 to i64
  %t1711 = inttoptr i64 %t1710 to ptr
  call void @intrinsic_print(ptr %t1711)
  %t1712 = load i64, ptr %local.c_mr.1430
  %t1713 = call i64 @"print_f64"(i64 %t1712)
  %t1714 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.256)
  %t1715 = ptrtoint ptr %t1714 to i64
  %t1716 = inttoptr i64 %t1715 to ptr
  call void @intrinsic_print(ptr %t1716)
  %t1717 = load i64, ptr %local.agree.1435
  %t1718 = call i64 @"print_f64"(i64 %t1717)
  %t1719 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.257)
  %t1720 = ptrtoint ptr %t1719 to i64
  %t1721 = inttoptr i64 %t1720 to ptr
  call void @intrinsic_println(ptr %t1721)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1722 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1723 = load i64, ptr %local.step.1412
  %t1724 = icmp eq i64 %t1723, 199
  %t1725 = zext i1 %t1724 to i64
  %t1726 = icmp ne i64 %t1725, 0
  br i1 %t1726, label %then37, label %else37
then37:
  %t1727 = load i64, ptr %local.c_em.1428
  %t1728 = load i64, ptr %local.c_er.1429
  %t1729 = call i64 @"sx_f64_add"(i64 %t1727, i64 %t1728)
  %t1730 = load i64, ptr %local.c_mr.1430
  %t1731 = call i64 @"sx_f64_add"(i64 %t1729, i64 %t1730)
  %t1732 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.258)
  %t1733 = call i64 @"sx_f64_div"(i64 %t1731, i64 %t1732)
  store i64 %t1733, ptr %local.agree.1436
  %t1734 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.259)
  %t1735 = ptrtoint ptr %t1734 to i64
  %t1736 = inttoptr i64 %t1735 to ptr
  call void @intrinsic_print(ptr %t1736)
  %t1737 = load i64, ptr %local.c_em.1428
  %t1738 = call i64 @"print_f64"(i64 %t1737)
  %t1739 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.260)
  %t1740 = ptrtoint ptr %t1739 to i64
  %t1741 = inttoptr i64 %t1740 to ptr
  call void @intrinsic_print(ptr %t1741)
  %t1742 = load i64, ptr %local.c_er.1429
  %t1743 = call i64 @"print_f64"(i64 %t1742)
  %t1744 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.261)
  %t1745 = ptrtoint ptr %t1744 to i64
  %t1746 = inttoptr i64 %t1745 to ptr
  call void @intrinsic_print(ptr %t1746)
  %t1747 = load i64, ptr %local.c_mr.1430
  %t1748 = call i64 @"print_f64"(i64 %t1747)
  %t1749 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.262)
  %t1750 = ptrtoint ptr %t1749 to i64
  %t1751 = inttoptr i64 %t1750 to ptr
  call void @intrinsic_print(ptr %t1751)
  %t1752 = load i64, ptr %local.agree.1436
  %t1753 = call i64 @"print_f64"(i64 %t1752)
  %t1754 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.263)
  %t1755 = ptrtoint ptr %t1754 to i64
  %t1756 = inttoptr i64 %t1755 to ptr
  call void @intrinsic_println(ptr %t1756)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1757 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t1758 = load i64, ptr %local.step.1412
  %t1759 = add i64 %t1758, 1
  store i64 %t1759, ptr %local.step.1412
  br label %loop31
endloop31:
  %t1760 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.264)
  %t1761 = ptrtoint ptr %t1760 to i64
  %t1762 = inttoptr i64 %t1761 to ptr
  call void @intrinsic_println(ptr %t1762)
  %t1763 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.265)
  %t1764 = ptrtoint ptr %t1763 to i64
  %t1765 = inttoptr i64 %t1764 to ptr
  call void @intrinsic_println(ptr %t1765)
  %t1766 = load i64, ptr %local.cos_em_sum.1414
  %t1767 = load i64, ptr %local.n_samples.1417
  %t1768 = call i64 @"sx_f64_div"(i64 %t1766, i64 %t1767)
  store i64 %t1768, ptr %local.avg_em.1437
  %t1769 = load i64, ptr %local.cos_er_sum.1415
  %t1770 = load i64, ptr %local.n_samples.1417
  %t1771 = call i64 @"sx_f64_div"(i64 %t1769, i64 %t1770)
  store i64 %t1771, ptr %local.avg_er.1438
  %t1772 = load i64, ptr %local.cos_mr_sum.1416
  %t1773 = load i64, ptr %local.n_samples.1417
  %t1774 = call i64 @"sx_f64_div"(i64 %t1772, i64 %t1773)
  store i64 %t1774, ptr %local.avg_mr.1439
  %t1775 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.266)
  %t1776 = ptrtoint ptr %t1775 to i64
  %t1777 = inttoptr i64 %t1776 to ptr
  call void @intrinsic_print(ptr %t1777)
  %t1778 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.267)
  %t1779 = ptrtoint ptr %t1778 to i64
  %t1780 = inttoptr i64 %t1779 to ptr
  call void @intrinsic_println(ptr %t1780)
  %t1781 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.268)
  %t1782 = ptrtoint ptr %t1781 to i64
  %t1783 = inttoptr i64 %t1782 to ptr
  call void @intrinsic_print(ptr %t1783)
  %t1784 = load i64, ptr %local.avg_em.1437
  %t1785 = call i64 @"print_f64"(i64 %t1784)
  %t1786 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.269)
  %t1787 = ptrtoint ptr %t1786 to i64
  %t1788 = inttoptr i64 %t1787 to ptr
  call void @intrinsic_print(ptr %t1788)
  %t1789 = load i64, ptr %local.avg_er.1438
  %t1790 = call i64 @"print_f64"(i64 %t1789)
  %t1791 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.270)
  %t1792 = ptrtoint ptr %t1791 to i64
  %t1793 = inttoptr i64 %t1792 to ptr
  call void @intrinsic_println(ptr %t1793)
  %t1794 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.271)
  %t1795 = ptrtoint ptr %t1794 to i64
  %t1796 = inttoptr i64 %t1795 to ptr
  call void @intrinsic_print(ptr %t1796)
  %t1797 = load i64, ptr %local.avg_em.1437
  %t1798 = call i64 @"print_f64"(i64 %t1797)
  %t1799 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.272)
  %t1800 = ptrtoint ptr %t1799 to i64
  %t1801 = inttoptr i64 %t1800 to ptr
  call void @intrinsic_print(ptr %t1801)
  %t1802 = load i64, ptr %local.avg_mr.1439
  %t1803 = call i64 @"print_f64"(i64 %t1802)
  %t1804 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.273)
  %t1805 = ptrtoint ptr %t1804 to i64
  %t1806 = inttoptr i64 %t1805 to ptr
  call void @intrinsic_println(ptr %t1806)
  %t1807 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.274)
  %t1808 = ptrtoint ptr %t1807 to i64
  %t1809 = inttoptr i64 %t1808 to ptr
  call void @intrinsic_print(ptr %t1809)
  %t1810 = load i64, ptr %local.avg_er.1438
  %t1811 = call i64 @"print_f64"(i64 %t1810)
  %t1812 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.275)
  %t1813 = ptrtoint ptr %t1812 to i64
  %t1814 = inttoptr i64 %t1813 to ptr
  call void @intrinsic_print(ptr %t1814)
  %t1815 = load i64, ptr %local.avg_mr.1439
  %t1816 = call i64 @"print_f64"(i64 %t1815)
  %t1817 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.276)
  %t1818 = ptrtoint ptr %t1817 to i64
  %t1819 = inttoptr i64 %t1818 to ptr
  call void @intrinsic_print(ptr %t1819)
  %t1820 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.277)
  %t1821 = ptrtoint ptr %t1820 to i64
  %t1822 = inttoptr i64 %t1821 to ptr
  call void @intrinsic_println(ptr %t1822)
  %t1823 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.278)
  %t1824 = ptrtoint ptr %t1823 to i64
  %t1825 = inttoptr i64 %t1824 to ptr
  call void @intrinsic_println(ptr %t1825)
  %t1826 = load i64, ptr %local.avg_mr.1439
  %t1827 = load i64, ptr %local.avg_em.1437
  %t1828 = call i64 @"sx_f64_gt"(i64 %t1826, i64 %t1827)
  %t1829 = icmp ne i64 %t1828, 0
  br i1 %t1829, label %then38, label %else38
then38:
  %t1830 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.279)
  %t1831 = ptrtoint ptr %t1830 to i64
  %t1832 = inttoptr i64 %t1831 to ptr
  call void @intrinsic_println(ptr %t1832)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1833 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1834 = load i64, ptr %local.avg_em.1437
  %t1835 = load i64, ptr %local.avg_mr.1439
  %t1836 = call i64 @"sx_f64_gt"(i64 %t1834, i64 %t1835)
  %t1837 = icmp ne i64 %t1836, 0
  br i1 %t1837, label %then39, label %else39
then39:
  %t1838 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.280)
  %t1839 = ptrtoint ptr %t1838 to i64
  %t1840 = inttoptr i64 %t1839 to ptr
  call void @intrinsic_println(ptr %t1840)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1841 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1842 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.281)
  %t1843 = ptrtoint ptr %t1842 to i64
  %t1844 = inttoptr i64 %t1843 to ptr
  call void @intrinsic_println(ptr %t1844)
  ret i64 0
}

define i64 @"run_exp4"() nounwind {
entry:
  %local.t.1845 = alloca i64
  %local.ye.1846 = alloca i64
  %local.ym.1847 = alloca i64
  %local.yr.1848 = alloca i64
  %local.step.1849 = alloca i64
  %local.h.1850 = alloca i64
  %local.sum_s.1851 = alloca i64
  %local.sum_e.1852 = alloca i64
  %local.sum_se.1853 = alloca i64
  %local.sum_s2.1854 = alloca i64
  %local.sum_e2.1855 = alloca i64
  %local.n.1856 = alloca i64
  %local.ne.1857 = alloca i64
  %local.nm.1858 = alloca i64
  %local.nr.1859 = alloca i64
  %local.ex.1860 = alloca i64
  %local.s_t.1861 = alloca i64
  %local.blend_val.1862 = alloca i64
  %local.true_err.1863 = alloca i64
  %local.blend_err.1864 = alloca i64
  %local.ratio.1865 = alloca i64
  %local.num.1866 = alloca i64
  %local.d1.1867 = alloca i64
  %local.d2.1868 = alloca i64
  %local.denom.1869 = alloca i64
  %local.corr.1870 = alloca i64
  %t1871 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.282)
  %t1872 = ptrtoint ptr %t1871 to i64
  %t1873 = inttoptr i64 %t1872 to ptr
  call void @intrinsic_println(ptr %t1873)
  %t1874 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.283)
  %t1875 = ptrtoint ptr %t1874 to i64
  %t1876 = inttoptr i64 %t1875 to ptr
  call void @intrinsic_println(ptr %t1876)
  %t1877 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.284)
  %t1878 = ptrtoint ptr %t1877 to i64
  %t1879 = inttoptr i64 %t1878 to ptr
  call void @intrinsic_println(ptr %t1879)
  %t1880 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.285)
  %t1881 = ptrtoint ptr %t1880 to i64
  %t1882 = inttoptr i64 %t1881 to ptr
  call void @intrinsic_println(ptr %t1882)
  %t1883 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.286)
  %t1884 = ptrtoint ptr %t1883 to i64
  %t1885 = inttoptr i64 %t1884 to ptr
  call void @intrinsic_println(ptr %t1885)
  %t1886 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.287)
  store i64 %t1886, ptr %local.t.1845
  %t1887 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.288)
  store i64 %t1887, ptr %local.ye.1846
  %t1888 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.289)
  store i64 %t1888, ptr %local.ym.1847
  %t1889 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.290)
  store i64 %t1889, ptr %local.yr.1848
  store i64 0, ptr %local.step.1849
  %t1890 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.291)
  store i64 %t1890, ptr %local.h.1850
  %t1891 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.292)
  store i64 %t1891, ptr %local.sum_s.1851
  %t1892 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.293)
  store i64 %t1892, ptr %local.sum_e.1852
  %t1893 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.294)
  store i64 %t1893, ptr %local.sum_se.1853
  %t1894 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.295)
  store i64 %t1894, ptr %local.sum_s2.1854
  %t1895 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.296)
  store i64 %t1895, ptr %local.sum_e2.1855
  %t1896 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.297)
  store i64 %t1896, ptr %local.n.1856
  %t1897 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.298)
  %t1898 = ptrtoint ptr %t1897 to i64
  %t1899 = inttoptr i64 %t1898 to ptr
  call void @intrinsic_println(ptr %t1899)
  %t1900 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.299)
  %t1901 = ptrtoint ptr %t1900 to i64
  %t1902 = inttoptr i64 %t1901 to ptr
  call void @intrinsic_println(ptr %t1902)
  br label %loop40
loop40:
  %t1903 = load i64, ptr %local.step.1849
  %t1904 = icmp slt i64 %t1903, 200
  %t1905 = zext i1 %t1904 to i64
  %t1906 = icmp ne i64 %t1905, 0
  br i1 %t1906, label %body40, label %endloop40
body40:
  %t1907 = load i64, ptr %local.t.1845
  %t1908 = load i64, ptr %local.ye.1846
  %t1909 = load i64, ptr %local.h.1850
  %t1910 = call i64 @"euler_step"(i64 %t1907, i64 %t1908, i64 %t1909)
  store i64 %t1910, ptr %local.ne.1857
  %t1911 = load i64, ptr %local.t.1845
  %t1912 = load i64, ptr %local.ym.1847
  %t1913 = load i64, ptr %local.h.1850
  %t1914 = call i64 @"midpoint_step"(i64 %t1911, i64 %t1912, i64 %t1913)
  store i64 %t1914, ptr %local.nm.1858
  %t1915 = load i64, ptr %local.t.1845
  %t1916 = load i64, ptr %local.yr.1848
  %t1917 = load i64, ptr %local.h.1850
  %t1918 = call i64 @"rk4_step"(i64 %t1915, i64 %t1916, i64 %t1917)
  store i64 %t1918, ptr %local.nr.1859
  %t1919 = load i64, ptr %local.ne.1857
  store i64 %t1919, ptr %local.ye.1846
  %t1920 = load i64, ptr %local.nm.1858
  store i64 %t1920, ptr %local.ym.1847
  %t1921 = load i64, ptr %local.nr.1859
  store i64 %t1921, ptr %local.yr.1848
  %t1922 = load i64, ptr %local.t.1845
  %t1923 = load i64, ptr %local.h.1850
  %t1924 = call i64 @"sx_f64_add"(i64 %t1922, i64 %t1923)
  store i64 %t1924, ptr %local.t.1845
  %t1925 = load i64, ptr %local.t.1845
  %t1926 = call i64 @"exact_sol"(i64 %t1925)
  store i64 %t1926, ptr %local.ex.1860
  %t1927 = load i64, ptr %local.ye.1846
  %t1928 = load i64, ptr %local.ym.1847
  %t1929 = load i64, ptr %local.yr.1848
  %t1930 = call i64 @"solver_variance"(i64 %t1927, i64 %t1928, i64 %t1929)
  store i64 %t1930, ptr %local.s_t.1861
  %t1931 = load i64, ptr %local.ye.1846
  %t1932 = load i64, ptr %local.ym.1847
  %t1933 = call i64 @"sx_f64_add"(i64 %t1931, i64 %t1932)
  %t1934 = load i64, ptr %local.yr.1848
  %t1935 = call i64 @"sx_f64_add"(i64 %t1933, i64 %t1934)
  %t1936 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.300)
  %t1937 = call i64 @"sx_f64_div"(i64 %t1935, i64 %t1936)
  store i64 %t1937, ptr %local.blend_val.1862
  %t1938 = load i64, ptr %local.blend_val.1862
  %t1939 = load i64, ptr %local.ex.1860
  %t1940 = call i64 @"sx_f64_sub"(i64 %t1938, i64 %t1939)
  %t1941 = call i64 @"abs_f64"(i64 %t1940)
  store i64 %t1941, ptr %local.true_err.1863
  %t1942 = load i64, ptr %local.blend_val.1862
  %t1943 = load i64, ptr %local.ex.1860
  %t1944 = call i64 @"sx_f64_sub"(i64 %t1942, i64 %t1943)
  %t1945 = call i64 @"abs_f64"(i64 %t1944)
  store i64 %t1945, ptr %local.blend_err.1864
  %t1946 = load i64, ptr %local.s_t.1861
  %t1947 = load i64, ptr %local.true_err.1863
  %t1948 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.301)
  %t1949 = call i64 @"sx_f64_add"(i64 %t1947, i64 %t1948)
  %t1950 = call i64 @"sx_f64_div"(i64 %t1946, i64 %t1949)
  store i64 %t1950, ptr %local.ratio.1865
  %t1951 = load i64, ptr %local.sum_s.1851
  %t1952 = load i64, ptr %local.s_t.1861
  %t1953 = call i64 @"sx_f64_add"(i64 %t1951, i64 %t1952)
  store i64 %t1953, ptr %local.sum_s.1851
  %t1954 = load i64, ptr %local.sum_e.1852
  %t1955 = load i64, ptr %local.true_err.1863
  %t1956 = call i64 @"sx_f64_add"(i64 %t1954, i64 %t1955)
  store i64 %t1956, ptr %local.sum_e.1852
  %t1957 = load i64, ptr %local.sum_se.1853
  %t1958 = load i64, ptr %local.s_t.1861
  %t1959 = load i64, ptr %local.true_err.1863
  %t1960 = call i64 @"sx_f64_mul"(i64 %t1958, i64 %t1959)
  %t1961 = call i64 @"sx_f64_add"(i64 %t1957, i64 %t1960)
  store i64 %t1961, ptr %local.sum_se.1853
  %t1962 = load i64, ptr %local.sum_s2.1854
  %t1963 = load i64, ptr %local.s_t.1861
  %t1964 = load i64, ptr %local.s_t.1861
  %t1965 = call i64 @"sx_f64_mul"(i64 %t1963, i64 %t1964)
  %t1966 = call i64 @"sx_f64_add"(i64 %t1962, i64 %t1965)
  store i64 %t1966, ptr %local.sum_s2.1854
  %t1967 = load i64, ptr %local.sum_e2.1855
  %t1968 = load i64, ptr %local.true_err.1863
  %t1969 = load i64, ptr %local.true_err.1863
  %t1970 = call i64 @"sx_f64_mul"(i64 %t1968, i64 %t1969)
  %t1971 = call i64 @"sx_f64_add"(i64 %t1967, i64 %t1970)
  store i64 %t1971, ptr %local.sum_e2.1855
  %t1972 = load i64, ptr %local.n.1856
  %t1973 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.302)
  %t1974 = call i64 @"sx_f64_add"(i64 %t1972, i64 %t1973)
  store i64 %t1974, ptr %local.n.1856
  %t1975 = load i64, ptr %local.step.1849
  %t1976 = icmp eq i64 %t1975, 0
  %t1977 = zext i1 %t1976 to i64
  %t1978 = icmp ne i64 %t1977, 0
  br i1 %t1978, label %then41, label %else41
then41:
  %t1979 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.303)
  %t1980 = ptrtoint ptr %t1979 to i64
  %t1981 = inttoptr i64 %t1980 to ptr
  call void @intrinsic_print(ptr %t1981)
  %t1982 = load i64, ptr %local.s_t.1861
  %t1983 = call i64 @"print_f64"(i64 %t1982)
  %t1984 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.304)
  %t1985 = ptrtoint ptr %t1984 to i64
  %t1986 = inttoptr i64 %t1985 to ptr
  call void @intrinsic_print(ptr %t1986)
  %t1987 = load i64, ptr %local.true_err.1863
  %t1988 = call i64 @"print_f64"(i64 %t1987)
  %t1989 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.305)
  %t1990 = ptrtoint ptr %t1989 to i64
  %t1991 = inttoptr i64 %t1990 to ptr
  call void @intrinsic_print(ptr %t1991)
  %t1992 = load i64, ptr %local.blend_err.1864
  %t1993 = call i64 @"print_f64"(i64 %t1992)
  %t1994 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.306)
  %t1995 = ptrtoint ptr %t1994 to i64
  %t1996 = inttoptr i64 %t1995 to ptr
  call void @intrinsic_print(ptr %t1996)
  %t1997 = load i64, ptr %local.ratio.1865
  %t1998 = call i64 @"print_f64"(i64 %t1997)
  %t1999 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.307)
  %t2000 = ptrtoint ptr %t1999 to i64
  %t2001 = inttoptr i64 %t2000 to ptr
  call void @intrinsic_println(ptr %t2001)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t2002 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t2003 = load i64, ptr %local.step.1849
  %t2004 = icmp eq i64 %t2003, 9
  %t2005 = zext i1 %t2004 to i64
  %t2006 = icmp ne i64 %t2005, 0
  br i1 %t2006, label %then42, label %else42
then42:
  %t2007 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.308)
  %t2008 = ptrtoint ptr %t2007 to i64
  %t2009 = inttoptr i64 %t2008 to ptr
  call void @intrinsic_print(ptr %t2009)
  %t2010 = load i64, ptr %local.s_t.1861
  %t2011 = call i64 @"print_f64"(i64 %t2010)
  %t2012 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.309)
  %t2013 = ptrtoint ptr %t2012 to i64
  %t2014 = inttoptr i64 %t2013 to ptr
  call void @intrinsic_print(ptr %t2014)
  %t2015 = load i64, ptr %local.true_err.1863
  %t2016 = call i64 @"print_f64"(i64 %t2015)
  %t2017 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.310)
  %t2018 = ptrtoint ptr %t2017 to i64
  %t2019 = inttoptr i64 %t2018 to ptr
  call void @intrinsic_print(ptr %t2019)
  %t2020 = load i64, ptr %local.blend_err.1864
  %t2021 = call i64 @"print_f64"(i64 %t2020)
  %t2022 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.311)
  %t2023 = ptrtoint ptr %t2022 to i64
  %t2024 = inttoptr i64 %t2023 to ptr
  call void @intrinsic_print(ptr %t2024)
  %t2025 = load i64, ptr %local.ratio.1865
  %t2026 = call i64 @"print_f64"(i64 %t2025)
  %t2027 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.312)
  %t2028 = ptrtoint ptr %t2027 to i64
  %t2029 = inttoptr i64 %t2028 to ptr
  call void @intrinsic_println(ptr %t2029)
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t2030 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t2031 = load i64, ptr %local.step.1849
  %t2032 = icmp eq i64 %t2031, 24
  %t2033 = zext i1 %t2032 to i64
  %t2034 = icmp ne i64 %t2033, 0
  br i1 %t2034, label %then43, label %else43
then43:
  %t2035 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.313)
  %t2036 = ptrtoint ptr %t2035 to i64
  %t2037 = inttoptr i64 %t2036 to ptr
  call void @intrinsic_print(ptr %t2037)
  %t2038 = load i64, ptr %local.s_t.1861
  %t2039 = call i64 @"print_f64"(i64 %t2038)
  %t2040 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.314)
  %t2041 = ptrtoint ptr %t2040 to i64
  %t2042 = inttoptr i64 %t2041 to ptr
  call void @intrinsic_print(ptr %t2042)
  %t2043 = load i64, ptr %local.true_err.1863
  %t2044 = call i64 @"print_f64"(i64 %t2043)
  %t2045 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.315)
  %t2046 = ptrtoint ptr %t2045 to i64
  %t2047 = inttoptr i64 %t2046 to ptr
  call void @intrinsic_print(ptr %t2047)
  %t2048 = load i64, ptr %local.blend_err.1864
  %t2049 = call i64 @"print_f64"(i64 %t2048)
  %t2050 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.316)
  %t2051 = ptrtoint ptr %t2050 to i64
  %t2052 = inttoptr i64 %t2051 to ptr
  call void @intrinsic_print(ptr %t2052)
  %t2053 = load i64, ptr %local.ratio.1865
  %t2054 = call i64 @"print_f64"(i64 %t2053)
  %t2055 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.317)
  %t2056 = ptrtoint ptr %t2055 to i64
  %t2057 = inttoptr i64 %t2056 to ptr
  call void @intrinsic_println(ptr %t2057)
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t2058 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t2059 = load i64, ptr %local.step.1849
  %t2060 = icmp eq i64 %t2059, 49
  %t2061 = zext i1 %t2060 to i64
  %t2062 = icmp ne i64 %t2061, 0
  br i1 %t2062, label %then44, label %else44
then44:
  %t2063 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.318)
  %t2064 = ptrtoint ptr %t2063 to i64
  %t2065 = inttoptr i64 %t2064 to ptr
  call void @intrinsic_print(ptr %t2065)
  %t2066 = load i64, ptr %local.s_t.1861
  %t2067 = call i64 @"print_f64"(i64 %t2066)
  %t2068 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.319)
  %t2069 = ptrtoint ptr %t2068 to i64
  %t2070 = inttoptr i64 %t2069 to ptr
  call void @intrinsic_print(ptr %t2070)
  %t2071 = load i64, ptr %local.true_err.1863
  %t2072 = call i64 @"print_f64"(i64 %t2071)
  %t2073 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.320)
  %t2074 = ptrtoint ptr %t2073 to i64
  %t2075 = inttoptr i64 %t2074 to ptr
  call void @intrinsic_print(ptr %t2075)
  %t2076 = load i64, ptr %local.blend_err.1864
  %t2077 = call i64 @"print_f64"(i64 %t2076)
  %t2078 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.321)
  %t2079 = ptrtoint ptr %t2078 to i64
  %t2080 = inttoptr i64 %t2079 to ptr
  call void @intrinsic_print(ptr %t2080)
  %t2081 = load i64, ptr %local.ratio.1865
  %t2082 = call i64 @"print_f64"(i64 %t2081)
  %t2083 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.322)
  %t2084 = ptrtoint ptr %t2083 to i64
  %t2085 = inttoptr i64 %t2084 to ptr
  call void @intrinsic_println(ptr %t2085)
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t2086 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t2087 = load i64, ptr %local.step.1849
  %t2088 = icmp eq i64 %t2087, 99
  %t2089 = zext i1 %t2088 to i64
  %t2090 = icmp ne i64 %t2089, 0
  br i1 %t2090, label %then45, label %else45
then45:
  %t2091 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.323)
  %t2092 = ptrtoint ptr %t2091 to i64
  %t2093 = inttoptr i64 %t2092 to ptr
  call void @intrinsic_print(ptr %t2093)
  %t2094 = load i64, ptr %local.s_t.1861
  %t2095 = call i64 @"print_f64"(i64 %t2094)
  %t2096 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.324)
  %t2097 = ptrtoint ptr %t2096 to i64
  %t2098 = inttoptr i64 %t2097 to ptr
  call void @intrinsic_print(ptr %t2098)
  %t2099 = load i64, ptr %local.true_err.1863
  %t2100 = call i64 @"print_f64"(i64 %t2099)
  %t2101 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.325)
  %t2102 = ptrtoint ptr %t2101 to i64
  %t2103 = inttoptr i64 %t2102 to ptr
  call void @intrinsic_print(ptr %t2103)
  %t2104 = load i64, ptr %local.blend_err.1864
  %t2105 = call i64 @"print_f64"(i64 %t2104)
  %t2106 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.326)
  %t2107 = ptrtoint ptr %t2106 to i64
  %t2108 = inttoptr i64 %t2107 to ptr
  call void @intrinsic_print(ptr %t2108)
  %t2109 = load i64, ptr %local.ratio.1865
  %t2110 = call i64 @"print_f64"(i64 %t2109)
  %t2111 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.327)
  %t2112 = ptrtoint ptr %t2111 to i64
  %t2113 = inttoptr i64 %t2112 to ptr
  call void @intrinsic_println(ptr %t2113)
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t2114 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t2115 = load i64, ptr %local.step.1849
  %t2116 = icmp eq i64 %t2115, 149
  %t2117 = zext i1 %t2116 to i64
  %t2118 = icmp ne i64 %t2117, 0
  br i1 %t2118, label %then46, label %else46
then46:
  %t2119 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.328)
  %t2120 = ptrtoint ptr %t2119 to i64
  %t2121 = inttoptr i64 %t2120 to ptr
  call void @intrinsic_print(ptr %t2121)
  %t2122 = load i64, ptr %local.s_t.1861
  %t2123 = call i64 @"print_f64"(i64 %t2122)
  %t2124 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.329)
  %t2125 = ptrtoint ptr %t2124 to i64
  %t2126 = inttoptr i64 %t2125 to ptr
  call void @intrinsic_print(ptr %t2126)
  %t2127 = load i64, ptr %local.true_err.1863
  %t2128 = call i64 @"print_f64"(i64 %t2127)
  %t2129 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.330)
  %t2130 = ptrtoint ptr %t2129 to i64
  %t2131 = inttoptr i64 %t2130 to ptr
  call void @intrinsic_print(ptr %t2131)
  %t2132 = load i64, ptr %local.blend_err.1864
  %t2133 = call i64 @"print_f64"(i64 %t2132)
  %t2134 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.331)
  %t2135 = ptrtoint ptr %t2134 to i64
  %t2136 = inttoptr i64 %t2135 to ptr
  call void @intrinsic_print(ptr %t2136)
  %t2137 = load i64, ptr %local.ratio.1865
  %t2138 = call i64 @"print_f64"(i64 %t2137)
  %t2139 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.332)
  %t2140 = ptrtoint ptr %t2139 to i64
  %t2141 = inttoptr i64 %t2140 to ptr
  call void @intrinsic_println(ptr %t2141)
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t2142 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t2143 = load i64, ptr %local.step.1849
  %t2144 = icmp eq i64 %t2143, 199
  %t2145 = zext i1 %t2144 to i64
  %t2146 = icmp ne i64 %t2145, 0
  br i1 %t2146, label %then47, label %else47
then47:
  %t2147 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.333)
  %t2148 = ptrtoint ptr %t2147 to i64
  %t2149 = inttoptr i64 %t2148 to ptr
  call void @intrinsic_print(ptr %t2149)
  %t2150 = load i64, ptr %local.s_t.1861
  %t2151 = call i64 @"print_f64"(i64 %t2150)
  %t2152 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.334)
  %t2153 = ptrtoint ptr %t2152 to i64
  %t2154 = inttoptr i64 %t2153 to ptr
  call void @intrinsic_print(ptr %t2154)
  %t2155 = load i64, ptr %local.true_err.1863
  %t2156 = call i64 @"print_f64"(i64 %t2155)
  %t2157 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.335)
  %t2158 = ptrtoint ptr %t2157 to i64
  %t2159 = inttoptr i64 %t2158 to ptr
  call void @intrinsic_print(ptr %t2159)
  %t2160 = load i64, ptr %local.blend_err.1864
  %t2161 = call i64 @"print_f64"(i64 %t2160)
  %t2162 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.336)
  %t2163 = ptrtoint ptr %t2162 to i64
  %t2164 = inttoptr i64 %t2163 to ptr
  call void @intrinsic_print(ptr %t2164)
  %t2165 = load i64, ptr %local.ratio.1865
  %t2166 = call i64 @"print_f64"(i64 %t2165)
  %t2167 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.337)
  %t2168 = ptrtoint ptr %t2167 to i64
  %t2169 = inttoptr i64 %t2168 to ptr
  call void @intrinsic_println(ptr %t2169)
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t2170 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t2171 = load i64, ptr %local.step.1849
  %t2172 = add i64 %t2171, 1
  store i64 %t2172, ptr %local.step.1849
  br label %loop40
endloop40:
  %t2173 = load i64, ptr %local.n.1856
  %t2174 = load i64, ptr %local.sum_se.1853
  %t2175 = call i64 @"sx_f64_mul"(i64 %t2173, i64 %t2174)
  %t2176 = load i64, ptr %local.sum_s.1851
  %t2177 = load i64, ptr %local.sum_e.1852
  %t2178 = call i64 @"sx_f64_mul"(i64 %t2176, i64 %t2177)
  %t2179 = call i64 @"sx_f64_sub"(i64 %t2175, i64 %t2178)
  store i64 %t2179, ptr %local.num.1866
  %t2180 = load i64, ptr %local.n.1856
  %t2181 = load i64, ptr %local.sum_s2.1854
  %t2182 = call i64 @"sx_f64_mul"(i64 %t2180, i64 %t2181)
  %t2183 = load i64, ptr %local.sum_s.1851
  %t2184 = load i64, ptr %local.sum_s.1851
  %t2185 = call i64 @"sx_f64_mul"(i64 %t2183, i64 %t2184)
  %t2186 = call i64 @"sx_f64_sub"(i64 %t2182, i64 %t2185)
  store i64 %t2186, ptr %local.d1.1867
  %t2187 = load i64, ptr %local.n.1856
  %t2188 = load i64, ptr %local.sum_e2.1855
  %t2189 = call i64 @"sx_f64_mul"(i64 %t2187, i64 %t2188)
  %t2190 = load i64, ptr %local.sum_e.1852
  %t2191 = load i64, ptr %local.sum_e.1852
  %t2192 = call i64 @"sx_f64_mul"(i64 %t2190, i64 %t2191)
  %t2193 = call i64 @"sx_f64_sub"(i64 %t2189, i64 %t2192)
  store i64 %t2193, ptr %local.d2.1868
  %t2194 = load i64, ptr %local.d1.1867
  %t2195 = load i64, ptr %local.d2.1868
  %t2196 = call i64 @"sx_f64_mul"(i64 %t2194, i64 %t2195)
  %t2197 = call i64 @"abs_f64"(i64 %t2196)
  %t2198 = call i64 @"sqrt_f64"(i64 %t2197)
  %t2199 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.338)
  %t2200 = call i64 @"sx_f64_add"(i64 %t2198, i64 %t2199)
  store i64 %t2200, ptr %local.denom.1869
  %t2201 = load i64, ptr %local.num.1866
  %t2202 = load i64, ptr %local.denom.1869
  %t2203 = call i64 @"sx_f64_div"(i64 %t2201, i64 %t2202)
  store i64 %t2203, ptr %local.corr.1870
  %t2204 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.339)
  %t2205 = ptrtoint ptr %t2204 to i64
  %t2206 = inttoptr i64 %t2205 to ptr
  call void @intrinsic_println(ptr %t2206)
  %t2207 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.340)
  %t2208 = ptrtoint ptr %t2207 to i64
  %t2209 = inttoptr i64 %t2208 to ptr
  call void @intrinsic_print(ptr %t2209)
  %t2210 = load i64, ptr %local.corr.1870
  %t2211 = call i64 @"print_f64"(i64 %t2210)
  %t2212 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.341)
  %t2213 = ptrtoint ptr %t2212 to i64
  %t2214 = inttoptr i64 %t2213 to ptr
  call void @intrinsic_println(ptr %t2214)
  %t2215 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.342)
  %t2216 = ptrtoint ptr %t2215 to i64
  %t2217 = inttoptr i64 %t2216 to ptr
  call void @intrinsic_println(ptr %t2217)
  %t2218 = load i64, ptr %local.corr.1870
  %t2219 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.343)
  %t2220 = call i64 @"sx_f64_gt"(i64 %t2218, i64 %t2219)
  %t2221 = icmp ne i64 %t2220, 0
  br i1 %t2221, label %then48, label %else48
then48:
  %t2222 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.344)
  %t2223 = ptrtoint ptr %t2222 to i64
  %t2224 = inttoptr i64 %t2223 to ptr
  call void @intrinsic_println(ptr %t2224)
  %t2225 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.345)
  %t2226 = ptrtoint ptr %t2225 to i64
  %t2227 = inttoptr i64 %t2226 to ptr
  call void @intrinsic_println(ptr %t2227)
  %t2228 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.346)
  %t2229 = ptrtoint ptr %t2228 to i64
  %t2230 = inttoptr i64 %t2229 to ptr
  call void @intrinsic_println(ptr %t2230)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  %t2231 = load i64, ptr %local.corr.1870
  %t2232 = call i64 @f64_parse(ptr @.str.exp_ode_solvers.347)
  %t2233 = call i64 @"sx_f64_gt"(i64 %t2231, i64 %t2232)
  %t2234 = icmp ne i64 %t2233, 0
  br i1 %t2234, label %then49, label %else49
then49:
  %t2235 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.348)
  %t2236 = ptrtoint ptr %t2235 to i64
  %t2237 = inttoptr i64 %t2236 to ptr
  call void @intrinsic_println(ptr %t2237)
  %t2238 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.349)
  %t2239 = ptrtoint ptr %t2238 to i64
  %t2240 = inttoptr i64 %t2239 to ptr
  call void @intrinsic_println(ptr %t2240)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  %t2241 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.350)
  %t2242 = ptrtoint ptr %t2241 to i64
  %t2243 = inttoptr i64 %t2242 to ptr
  call void @intrinsic_println(ptr %t2243)
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t2244 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t2245 = phi i64 [ 0, %then48_end ], [ %t2244, %else48_end ]
  %t2246 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.351)
  %t2247 = ptrtoint ptr %t2246 to i64
  %t2248 = inttoptr i64 %t2247 to ptr
  call void @intrinsic_println(ptr %t2248)
  %t2249 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.352)
  %t2250 = ptrtoint ptr %t2249 to i64
  %t2251 = inttoptr i64 %t2250 to ptr
  call void @intrinsic_println(ptr %t2251)
  %t2252 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.353)
  %t2253 = ptrtoint ptr %t2252 to i64
  %t2254 = inttoptr i64 %t2253 to ptr
  call void @intrinsic_println(ptr %t2254)
  %t2255 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.354)
  %t2256 = ptrtoint ptr %t2255 to i64
  %t2257 = inttoptr i64 %t2256 to ptr
  call void @intrinsic_println(ptr %t2257)
  %t2258 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.355)
  %t2259 = ptrtoint ptr %t2258 to i64
  %t2260 = inttoptr i64 %t2259 to ptr
  call void @intrinsic_println(ptr %t2260)
  %t2261 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.356)
  %t2262 = ptrtoint ptr %t2261 to i64
  %t2263 = inttoptr i64 %t2262 to ptr
  call void @intrinsic_println(ptr %t2263)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.r1.2264 = alloca i64
  %local.r2.2265 = alloca i64
  %local.r3.2266 = alloca i64
  %local.r4.2267 = alloca i64
  %t2268 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.357)
  %t2269 = ptrtoint ptr %t2268 to i64
  %t2270 = inttoptr i64 %t2269 to ptr
  call void @intrinsic_println(ptr %t2270)
  %t2271 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.358)
  %t2272 = ptrtoint ptr %t2271 to i64
  %t2273 = inttoptr i64 %t2272 to ptr
  call void @intrinsic_println(ptr %t2273)
  %t2274 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.359)
  %t2275 = ptrtoint ptr %t2274 to i64
  %t2276 = inttoptr i64 %t2275 to ptr
  call void @intrinsic_println(ptr %t2276)
  %t2277 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.360)
  %t2278 = ptrtoint ptr %t2277 to i64
  %t2279 = inttoptr i64 %t2278 to ptr
  call void @intrinsic_println(ptr %t2279)
  %t2280 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.361)
  %t2281 = ptrtoint ptr %t2280 to i64
  %t2282 = inttoptr i64 %t2281 to ptr
  call void @intrinsic_println(ptr %t2282)
  %t2283 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.362)
  %t2284 = ptrtoint ptr %t2283 to i64
  %t2285 = inttoptr i64 %t2284 to ptr
  call void @intrinsic_println(ptr %t2285)
  %t2286 = call i64 @"run_exp1"()
  store i64 %t2286, ptr %local.r1.2264
  %t2287 = call i64 @"run_exp2"()
  store i64 %t2287, ptr %local.r2.2265
  %t2288 = call i64 @"run_exp3"()
  store i64 %t2288, ptr %local.r3.2266
  %t2289 = call i64 @"run_exp4"()
  store i64 %t2289, ptr %local.r4.2267
  %t2290 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.363)
  %t2291 = ptrtoint ptr %t2290 to i64
  %t2292 = inttoptr i64 %t2291 to ptr
  call void @intrinsic_println(ptr %t2292)
  %t2293 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.364)
  %t2294 = ptrtoint ptr %t2293 to i64
  %t2295 = inttoptr i64 %t2294 to ptr
  call void @intrinsic_println(ptr %t2295)
  %t2296 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.365)
  %t2297 = ptrtoint ptr %t2296 to i64
  %t2298 = inttoptr i64 %t2297 to ptr
  call void @intrinsic_println(ptr %t2298)
  %t2299 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.366)
  %t2300 = ptrtoint ptr %t2299 to i64
  %t2301 = inttoptr i64 %t2300 to ptr
  call void @intrinsic_println(ptr %t2301)
  %t2302 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.367)
  %t2303 = ptrtoint ptr %t2302 to i64
  %t2304 = inttoptr i64 %t2303 to ptr
  call void @intrinsic_println(ptr %t2304)
  %t2305 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.368)
  %t2306 = ptrtoint ptr %t2305 to i64
  %t2307 = inttoptr i64 %t2306 to ptr
  call void @intrinsic_println(ptr %t2307)
  %t2308 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.369)
  %t2309 = ptrtoint ptr %t2308 to i64
  %t2310 = inttoptr i64 %t2309 to ptr
  call void @intrinsic_println(ptr %t2310)
  %t2311 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.370)
  %t2312 = ptrtoint ptr %t2311 to i64
  %t2313 = inttoptr i64 %t2312 to ptr
  call void @intrinsic_println(ptr %t2313)
  %t2314 = call ptr @intrinsic_string_new(ptr @.str.exp_ode_solvers.371)
  %t2315 = ptrtoint ptr %t2314 to i64
  %t2316 = inttoptr i64 %t2315 to ptr
  call void @intrinsic_println(ptr %t2316)
  ret i64 0
}


; String constants
@.str.exp_ode_solvers.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.3 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ode_solvers.4 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ode_solvers.5 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ode_solvers.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.7 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ode_solvers.8 = private unnamed_addr constant [7 x i8] c"2501.0\00"
@.str.exp_ode_solvers.9 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.17 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ode_solvers.18 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_ode_solvers.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.25 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ode_solvers.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.29 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ode_solvers.30 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ode_solvers.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.37 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ode_solvers.38 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ode_solvers.39 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ode_solvers.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ode_solvers.41 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.42 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.43 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.45 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ode_solvers.46 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.47 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.48 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.49 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.50 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.51 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.52 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ode_solvers.53 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ode_solvers.54 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ode_solvers.55 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ode_solvers.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.57 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ode_solvers.58 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_ode_solvers.59 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.60 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.61 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.62 = private unnamed_addr constant [52 x i8] c"  EXP 1: Euler vs Midpoint vs RK4 — Learned Blend\00"
@.str.exp_ode_solvers.63 = private unnamed_addr constant [58 x i8] c"  Stiff ODE: dy/dt = -50*(y - cos(t)), h=0.01, t in [0,2]\00"
@.str.exp_ode_solvers.64 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.65 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.66 = private unnamed_addr constant [26 x i8] c"  Euler total error:     \00"
@.str.exp_ode_solvers.67 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.68 = private unnamed_addr constant [26 x i8] c"  Midpoint total error:  \00"
@.str.exp_ode_solvers.69 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.70 = private unnamed_addr constant [26 x i8] c"  RK4 total error:       \00"
@.str.exp_ode_solvers.71 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.72 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.73 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.74 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.75 = private unnamed_addr constant [26 x i8] c"  Equal blend error:     \00"
@.str.exp_ode_solvers.76 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.77 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.78 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.79 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.80 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.81 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ode_solvers.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.83 = private unnamed_addr constant [46 x i8] c"  Cycle  w_euler  w_mid    w_rk4    blend_err\00"
@.str.exp_ode_solvers.84 = private unnamed_addr constant [46 x i8] c"  -----  -------  -------  -------  ---------\00"
@.str.exp_ode_solvers.85 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.86 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.87 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.88 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.89 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.90 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.91 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.92 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_ode_solvers.93 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.94 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.95 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.96 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.97 = private unnamed_addr constant [10 x i8] c"  9      \00"
@.str.exp_ode_solvers.98 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.99 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.100 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.102 = private unnamed_addr constant [10 x i8] c"  19     \00"
@.str.exp_ode_solvers.103 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.104 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.105 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.107 = private unnamed_addr constant [10 x i8] c"  39     \00"
@.str.exp_ode_solvers.108 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.109 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.110 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.112 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.113 = private unnamed_addr constant [26 x i8] c"  Learned blend error:   \00"
@.str.exp_ode_solvers.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.115 = private unnamed_addr constant [29 x i8] c"  Normalized weights: euler=\00"
@.str.exp_ode_solvers.116 = private unnamed_addr constant [7 x i8] c"  mid=\00"
@.str.exp_ode_solvers.117 = private unnamed_addr constant [7 x i8] c"  rk4=\00"
@.str.exp_ode_solvers.118 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.119 = private unnamed_addr constant [47 x i8] c"  PASS: Learned blend beats equal-weight blend\00"
@.str.exp_ode_solvers.120 = private unnamed_addr constant [41 x i8] c"  NOTE: Equal blend already near-optimal\00"
@.str.exp_ode_solvers.121 = private unnamed_addr constant [40 x i8] c"  PASS: Learned blend beats Euler alone\00"
@.str.exp_ode_solvers.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.123 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.124 = private unnamed_addr constant [45 x i8] c"  EXP 2: Adaptive Solver Selection by Region\00"
@.str.exp_ode_solvers.125 = private unnamed_addr constant [55 x i8] c"  Do learned weights shift from RK4-heavy to balanced?\00"
@.str.exp_ode_solvers.126 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.127 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.128 = private unnamed_addr constant [53 x i8] c"  Region     w_euler  w_mid    w_rk4    (normalized)\00"
@.str.exp_ode_solvers.129 = private unnamed_addr constant [39 x i8] c"  ---------  -------  -------  -------\00"
@.str.exp_ode_solvers.130 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.131 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.132 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.134 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ode_solvers.135 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.136 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.137 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.139 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.140 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.141 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.142 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.143 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.144 = private unnamed_addr constant [14 x i8] c"  [0.0,0.5]  \00"
@.str.exp_ode_solvers.145 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.146 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.147 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.148 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.149 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.150 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.151 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ode_solvers.152 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.153 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.154 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ode_solvers.155 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.156 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.157 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ode_solvers.158 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.159 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.160 = private unnamed_addr constant [14 x i8] c"  [0.5,1.0]  \00"
@.str.exp_ode_solvers.161 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.162 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.163 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.164 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.165 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.166 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.167 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.168 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.169 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.170 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.171 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.172 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.173 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.174 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.175 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.176 = private unnamed_addr constant [14 x i8] c"  [1.0,1.5]  \00"
@.str.exp_ode_solvers.177 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.178 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.179 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.180 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.181 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.182 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.183 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_ode_solvers.184 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.185 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.186 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_ode_solvers.187 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.188 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.189 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_ode_solvers.190 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ode_solvers.191 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ode_solvers.192 = private unnamed_addr constant [14 x i8] c"  [1.5,2.0]  \00"
@.str.exp_ode_solvers.193 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.194 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.195 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.197 = private unnamed_addr constant [21 x i8] c"  RK4 weight early: \00"
@.str.exp_ode_solvers.198 = private unnamed_addr constant [9 x i8] c"  late: \00"
@.str.exp_ode_solvers.199 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.200 = private unnamed_addr constant [23 x i8] c"  Euler weight early: \00"
@.str.exp_ode_solvers.201 = private unnamed_addr constant [9 x i8] c"  late: \00"
@.str.exp_ode_solvers.202 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.203 = private unnamed_addr constant [55 x i8] c"  PASS: Weights shift away from RK4 as stiffness fades\00"
@.str.exp_ode_solvers.204 = private unnamed_addr constant [60 x i8] c"  NOTE: RK4 remains dominant (stiffness persists at h=0.01)\00"
@.str.exp_ode_solvers.205 = private unnamed_addr constant [43 x i8] c"  PASS: Euler gains trust in smooth region\00"
@.str.exp_ode_solvers.206 = private unnamed_addr constant [53 x i8] c"  NOTE: Euler weight did not increase in late region\00"
@.str.exp_ode_solvers.207 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.208 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.209 = private unnamed_addr constant [35 x i8] c"  EXP 3: Solver Interaction Matrix\00"
@.str.exp_ode_solvers.210 = private unnamed_addr constant [53 x i8] c"  Cosine of solver error directions at each timestep\00"
@.str.exp_ode_solvers.211 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.212 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.213 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.214 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.215 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.216 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.217 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ode_solvers.218 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.219 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.220 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.221 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.222 = private unnamed_addr constant [54 x i8] c"  t        cos(E,M)   cos(E,R)   cos(M,R)   agreement\00"
@.str.exp_ode_solvers.223 = private unnamed_addr constant [54 x i8] c"  -------  --------   --------   --------   ---------\00"
@.str.exp_ode_solvers.224 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_ode_solvers.225 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_ode_solvers.226 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_ode_solvers.227 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.228 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.229 = private unnamed_addr constant [12 x i8] c"  0.05     \00"
@.str.exp_ode_solvers.230 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.231 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.232 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.233 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.234 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.235 = private unnamed_addr constant [12 x i8] c"  0.25     \00"
@.str.exp_ode_solvers.236 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.237 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.238 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.239 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.240 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.241 = private unnamed_addr constant [12 x i8] c"  0.50     \00"
@.str.exp_ode_solvers.242 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.243 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.244 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.245 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.246 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.247 = private unnamed_addr constant [12 x i8] c"  1.00     \00"
@.str.exp_ode_solvers.248 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.249 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.250 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.251 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.252 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.253 = private unnamed_addr constant [12 x i8] c"  1.50     \00"
@.str.exp_ode_solvers.254 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.255 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.256 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.257 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.258 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.259 = private unnamed_addr constant [12 x i8] c"  2.00     \00"
@.str.exp_ode_solvers.260 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.261 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.262 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ode_solvers.263 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.264 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.265 = private unnamed_addr constant [30 x i8] c"  Average Interaction Matrix:\00"
@.str.exp_ode_solvers.266 = private unnamed_addr constant [27 x i8] c"         Euler  Midpt  RK4\00"
@.str.exp_ode_solvers.267 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.268 = private unnamed_addr constant [17 x i8] c"  Euler  1.000  \00"
@.str.exp_ode_solvers.269 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.270 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.271 = private unnamed_addr constant [10 x i8] c"  Midpt  \00"
@.str.exp_ode_solvers.272 = private unnamed_addr constant [10 x i8] c"  1.000  \00"
@.str.exp_ode_solvers.273 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.274 = private unnamed_addr constant [10 x i8] c"  RK4    \00"
@.str.exp_ode_solvers.275 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.276 = private unnamed_addr constant [8 x i8] c"  1.000\00"
@.str.exp_ode_solvers.277 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.278 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.279 = private unnamed_addr constant [57 x i8] c"  Midpoint-RK4 most compatible (similar error direction)\00"
@.str.exp_ode_solvers.280 = private unnamed_addr constant [59 x i8] c"  Euler-Midpoint most compatible (similar error direction)\00"
@.str.exp_ode_solvers.281 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.282 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.283 = private unnamed_addr constant [48 x i8] c"  EXP 4: Convergence Score S(t) vs Actual Error\00"
@.str.exp_ode_solvers.284 = private unnamed_addr constant [49 x i8] c"  S(t) = solver variance. Does it predict error?\00"
@.str.exp_ode_solvers.285 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_ode_solvers.286 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.287 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.288 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.289 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.290 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.291 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ode_solvers.292 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.293 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.294 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.295 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.296 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.297 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ode_solvers.298 = private unnamed_addr constant [56 x i8] c"  t        S(t)       true_err   blend_err  ratio S/err\00"
@.str.exp_ode_solvers.299 = private unnamed_addr constant [56 x i8] c"  -------  ---------  ---------  ---------  -----------\00"
@.str.exp_ode_solvers.300 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ode_solvers.301 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_ode_solvers.302 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ode_solvers.303 = private unnamed_addr constant [12 x i8] c"  0.01     \00"
@.str.exp_ode_solvers.304 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.305 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.306 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.307 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.308 = private unnamed_addr constant [12 x i8] c"  0.10     \00"
@.str.exp_ode_solvers.309 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.310 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.311 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.312 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.313 = private unnamed_addr constant [12 x i8] c"  0.25     \00"
@.str.exp_ode_solvers.314 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.315 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.316 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.317 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.318 = private unnamed_addr constant [12 x i8] c"  0.50     \00"
@.str.exp_ode_solvers.319 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.320 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.321 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.322 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.323 = private unnamed_addr constant [12 x i8] c"  1.00     \00"
@.str.exp_ode_solvers.324 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.325 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.326 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.327 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.328 = private unnamed_addr constant [12 x i8] c"  1.50     \00"
@.str.exp_ode_solvers.329 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.330 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.331 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.332 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.333 = private unnamed_addr constant [12 x i8] c"  2.00     \00"
@.str.exp_ode_solvers.334 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.335 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.336 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ode_solvers.337 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.338 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_ode_solvers.339 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.340 = private unnamed_addr constant [41 x i8] c"  Pearson correlation (S vs error): r = \00"
@.str.exp_ode_solvers.341 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.342 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.343 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ode_solvers.344 = private unnamed_addr constant [54 x i8] c"  PASS: S(t) strongly correlates with error (r > 0.7)\00"
@.str.exp_ode_solvers.345 = private unnamed_addr constant [52 x i8] c"  Solver disagreement IS a reliable error estimator\00"
@.str.exp_ode_solvers.346 = private unnamed_addr constant [47 x i8] c"  => S(t) can drive adaptive step size control\00"
@.str.exp_ode_solvers.347 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ode_solvers.348 = private unnamed_addr constant [48 x i8] c"  PARTIAL: Moderate correlation (0.3 < r < 0.7)\00"
@.str.exp_ode_solvers.349 = private unnamed_addr constant [41 x i8] c"  S(t) is a weak but useful error signal\00"
@.str.exp_ode_solvers.350 = private unnamed_addr constant [57 x i8] c"  WEAK: Low correlation — S(t) is not a reliable proxy\00"
@.str.exp_ode_solvers.351 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.352 = private unnamed_addr constant [31 x i8] c"  Adaptive step size strategy:\00"
@.str.exp_ode_solvers.353 = private unnamed_addr constant [62 x i8] c"  - When S(t) > threshold: halve step size (solvers disagree)\00"
@.str.exp_ode_solvers.354 = private unnamed_addr constant [60 x i8] c"  - When S(t) < threshold: double step size (solvers agree)\00"
@.str.exp_ode_solvers.355 = private unnamed_addr constant [50 x i8] c"  The correlation score validates this heuristic.\00"
@.str.exp_ode_solvers.356 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.357 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_ode_solvers.358 = private unnamed_addr constant [55 x i8] c"  GEOMETRIC CONTRACTION FRAMEWORK: ODE SOLVER BLENDING\00"
@.str.exp_ode_solvers.359 = private unnamed_addr constant [48 x i8] c"  Stiff ODE: dy/dt = -50*(y - cos(t)), y(0) = 0\00"
@.str.exp_ode_solvers.360 = private unnamed_addr constant [60 x i8] c"  Three solvers, learnable weights, meta-gradient selection\00"
@.str.exp_ode_solvers.361 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_ode_solvers.362 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ode_solvers.363 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_ode_solvers.364 = private unnamed_addr constant [10 x i8] c"  SUMMARY\00"
@.str.exp_ode_solvers.365 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_ode_solvers.366 = private unnamed_addr constant [61 x i8] c"  Exp 1: Learned blend weights beat naive equal-weight blend\00"
@.str.exp_ode_solvers.367 = private unnamed_addr constant [69 x i8] c"  Exp 2: Weights adapt by region — RK4 dominant early, shifts late\00"
@.str.exp_ode_solvers.368 = private unnamed_addr constant [57 x i8] c"  Exp 3: Interaction matrix reveals solver compatibility\00"
@.str.exp_ode_solvers.369 = private unnamed_addr constant [61 x i8] c"  Exp 4: Convergence score S(t) correlates with actual error\00"
@.str.exp_ode_solvers.370 = private unnamed_addr constant [63 x i8] c"         => meta-learned disagreement drives adaptive stepping\00"
@.str.exp_ode_solvers.371 = private unnamed_addr constant [65 x i8] c"================================================================\00"
