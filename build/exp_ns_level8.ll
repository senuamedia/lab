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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_level8.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_level8.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"max_f64"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t9 = load i64, ptr %local.a
  %t10 = load i64, ptr %local.b
  %t11 = call i64 @"sx_f64_gt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.a
  br label %then1_end
then1_end:
  br label %endif1
else1:
  %t14 = load i64, ptr %local.b
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t15 = phi i64 [ %t13, %then1_end ], [ %t14, %else1_end ]
  ret i64 %t15
}

define i64 @"step5"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %dt, i64 %dx, i64 %i, i64 %boundary_damp) nounwind {
entry:
  %local.um.16 = alloca i64
  %local.ui.17 = alloca i64
  %local.up.18 = alloca i64
  %local.adv.19 = alloca i64
  %local.diff.20 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %local.boundary_damp = alloca i64
  store i64 %boundary_damp, ptr %local.boundary_damp
  %t21 = load i64, ptr %local.u4
  %t22 = load i64, ptr %local.boundary_damp
  %t23 = call i64 @"sx_f64_mul"(i64 %t21, i64 %t22)
  store i64 %t23, ptr %local.um.16
  %t24 = load i64, ptr %local.u0
  store i64 %t24, ptr %local.ui.17
  %t25 = load i64, ptr %local.u1
  store i64 %t25, ptr %local.up.18
  %t26 = load i64, ptr %local.i
  %t27 = icmp eq i64 %t26, 1
  %t28 = zext i1 %t27 to i64
  %t29 = icmp ne i64 %t28, 0
  br i1 %t29, label %then2, label %else2
then2:
  %t30 = load i64, ptr %local.u0
  store i64 %t30, ptr %local.um.16
  %t31 = load i64, ptr %local.u1
  store i64 %t31, ptr %local.ui.17
  %t32 = load i64, ptr %local.u2
  store i64 %t32, ptr %local.up.18
  br label %then2_end
then2_end:
  br label %endif2
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t33 = phi i64 [ 0, %then2_end ], [ 0, %else2_end ]
  %t34 = load i64, ptr %local.i
  %t35 = icmp eq i64 %t34, 2
  %t36 = zext i1 %t35 to i64
  %t37 = icmp ne i64 %t36, 0
  br i1 %t37, label %then3, label %else3
then3:
  %t38 = load i64, ptr %local.u1
  store i64 %t38, ptr %local.um.16
  %t39 = load i64, ptr %local.u2
  store i64 %t39, ptr %local.ui.17
  %t40 = load i64, ptr %local.u3
  store i64 %t40, ptr %local.up.18
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t41 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t42 = load i64, ptr %local.i
  %t43 = icmp eq i64 %t42, 3
  %t44 = zext i1 %t43 to i64
  %t45 = icmp ne i64 %t44, 0
  br i1 %t45, label %then4, label %else4
then4:
  %t46 = load i64, ptr %local.u2
  store i64 %t46, ptr %local.um.16
  %t47 = load i64, ptr %local.u3
  store i64 %t47, ptr %local.ui.17
  %t48 = load i64, ptr %local.u4
  store i64 %t48, ptr %local.up.18
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t49 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t50 = load i64, ptr %local.i
  %t51 = icmp eq i64 %t50, 4
  %t52 = zext i1 %t51 to i64
  %t53 = icmp ne i64 %t52, 0
  br i1 %t53, label %then5, label %else5
then5:
  %t54 = load i64, ptr %local.u3
  store i64 %t54, ptr %local.um.16
  %t55 = load i64, ptr %local.u4
  store i64 %t55, ptr %local.ui.17
  %t56 = load i64, ptr %local.u0
  %t57 = load i64, ptr %local.boundary_damp
  %t58 = call i64 @"sx_f64_mul"(i64 %t56, i64 %t57)
  store i64 %t58, ptr %local.up.18
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t59 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t60 = load i64, ptr %local.ui.17
  %t61 = load i64, ptr %local.up.18
  %t62 = load i64, ptr %local.um.16
  %t63 = call i64 @"sx_f64_sub"(i64 %t61, i64 %t62)
  %t64 = call i64 @"sx_f64_mul"(i64 %t60, i64 %t63)
  %t65 = call i64 @f64_parse(ptr @.str.exp_ns_level8.2)
  %t66 = load i64, ptr %local.dx
  %t67 = call i64 @"sx_f64_mul"(i64 %t65, i64 %t66)
  %t68 = call i64 @"sx_f64_div"(i64 %t64, i64 %t67)
  store i64 %t68, ptr %local.adv.19
  %t69 = load i64, ptr %local.nu
  %t70 = load i64, ptr %local.up.18
  %t71 = call i64 @f64_parse(ptr @.str.exp_ns_level8.3)
  %t72 = load i64, ptr %local.ui.17
  %t73 = call i64 @"sx_f64_mul"(i64 %t71, i64 %t72)
  %t74 = call i64 @"sx_f64_sub"(i64 %t70, i64 %t73)
  %t75 = load i64, ptr %local.um.16
  %t76 = call i64 @"sx_f64_add"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t76)
  %t78 = load i64, ptr %local.dx
  %t79 = load i64, ptr %local.dx
  %t80 = call i64 @"sx_f64_mul"(i64 %t78, i64 %t79)
  %t81 = call i64 @"sx_f64_div"(i64 %t77, i64 %t80)
  store i64 %t81, ptr %local.diff.20
  %t82 = load i64, ptr %local.ui.17
  %t83 = load i64, ptr %local.dt
  %t84 = load i64, ptr %local.diff.20
  %t85 = load i64, ptr %local.adv.19
  %t86 = call i64 @"sx_f64_sub"(i64 %t84, i64 %t85)
  %t87 = call i64 @"sx_f64_mul"(i64 %t83, i64 %t86)
  %t88 = call i64 @"sx_f64_add"(i64 %t82, i64 %t87)
  ret i64 %t88
}

define i64 @"blowup_time"(i64 %amplitude, i64 %nu, i64 %dt, i64 %dx, i64 %boundary_damp, i64 %chaos_eps, i64 %max_steps, i64 %threshold) nounwind {
entry:
  %local.pi.89 = alloca i64
  %local.u0.90 = alloca i64
  %local.u1.91 = alloca i64
  %local.u2.92 = alloca i64
  %local.u3.93 = alloca i64
  %local.u4.94 = alloca i64
  %local.step.95 = alloca i64
  %local.mg.96 = alloca i64
  %local.n0.97 = alloca i64
  %local.n1.98 = alloca i64
  %local.n2.99 = alloca i64
  %local.n3.100 = alloca i64
  %local.n4.101 = alloca i64
  %local.g01.102 = alloca i64
  %local.g12.103 = alloca i64
  %local.g23.104 = alloca i64
  %local.g34.105 = alloca i64
  %local.amplitude = alloca i64
  store i64 %amplitude, ptr %local.amplitude
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.boundary_damp = alloca i64
  store i64 %boundary_damp, ptr %local.boundary_damp
  %local.chaos_eps = alloca i64
  store i64 %chaos_eps, ptr %local.chaos_eps
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %local.threshold = alloca i64
  store i64 %threshold, ptr %local.threshold
  %t106 = call i64 @f64_parse(ptr @.str.exp_ns_level8.4)
  store i64 %t106, ptr %local.pi.89
  %t107 = load i64, ptr %local.amplitude
  %t108 = call i64 @f64_parse(ptr @.str.exp_ns_level8.5)
  %t109 = load i64, ptr %local.pi.89
  %t110 = call i64 @"sx_f64_mul"(i64 %t108, i64 %t109)
  %t111 = call i64 @f64_parse(ptr @.str.exp_ns_level8.6)
  %t112 = call i64 @"sx_f64_mul"(i64 %t110, i64 %t111)
  %t113 = call i64 @f64_parse(ptr @.str.exp_ns_level8.7)
  %t114 = call i64 @"sx_f64_div"(i64 %t112, i64 %t113)
  %t115 = call i64 @"sin_f64"(i64 %t114)
  %t116 = call i64 @"sx_f64_mul"(i64 %t107, i64 %t115)
  store i64 %t116, ptr %local.u0.90
  %t117 = load i64, ptr %local.amplitude
  %t118 = call i64 @f64_parse(ptr @.str.exp_ns_level8.8)
  %t119 = load i64, ptr %local.pi.89
  %t120 = call i64 @"sx_f64_mul"(i64 %t118, i64 %t119)
  %t121 = call i64 @f64_parse(ptr @.str.exp_ns_level8.9)
  %t122 = call i64 @"sx_f64_mul"(i64 %t120, i64 %t121)
  %t123 = call i64 @f64_parse(ptr @.str.exp_ns_level8.10)
  %t124 = call i64 @"sx_f64_div"(i64 %t122, i64 %t123)
  %t125 = call i64 @"sin_f64"(i64 %t124)
  %t126 = call i64 @"sx_f64_mul"(i64 %t117, i64 %t125)
  store i64 %t126, ptr %local.u1.91
  %t127 = load i64, ptr %local.amplitude
  %t128 = call i64 @f64_parse(ptr @.str.exp_ns_level8.11)
  %t129 = load i64, ptr %local.pi.89
  %t130 = call i64 @"sx_f64_mul"(i64 %t128, i64 %t129)
  %t131 = call i64 @f64_parse(ptr @.str.exp_ns_level8.12)
  %t132 = call i64 @"sx_f64_mul"(i64 %t130, i64 %t131)
  %t133 = call i64 @f64_parse(ptr @.str.exp_ns_level8.13)
  %t134 = call i64 @"sx_f64_div"(i64 %t132, i64 %t133)
  %t135 = call i64 @"sin_f64"(i64 %t134)
  %t136 = call i64 @"sx_f64_mul"(i64 %t127, i64 %t135)
  store i64 %t136, ptr %local.u2.92
  %t137 = load i64, ptr %local.amplitude
  %t138 = call i64 @f64_parse(ptr @.str.exp_ns_level8.14)
  %t139 = load i64, ptr %local.pi.89
  %t140 = call i64 @"sx_f64_mul"(i64 %t138, i64 %t139)
  %t141 = call i64 @f64_parse(ptr @.str.exp_ns_level8.15)
  %t142 = call i64 @"sx_f64_mul"(i64 %t140, i64 %t141)
  %t143 = call i64 @f64_parse(ptr @.str.exp_ns_level8.16)
  %t144 = call i64 @"sx_f64_div"(i64 %t142, i64 %t143)
  %t145 = call i64 @"sin_f64"(i64 %t144)
  %t146 = call i64 @"sx_f64_mul"(i64 %t137, i64 %t145)
  store i64 %t146, ptr %local.u3.93
  %t147 = load i64, ptr %local.amplitude
  %t148 = call i64 @f64_parse(ptr @.str.exp_ns_level8.17)
  %t149 = load i64, ptr %local.pi.89
  %t150 = call i64 @"sx_f64_mul"(i64 %t148, i64 %t149)
  %t151 = call i64 @f64_parse(ptr @.str.exp_ns_level8.18)
  %t152 = call i64 @"sx_f64_mul"(i64 %t150, i64 %t151)
  %t153 = call i64 @f64_parse(ptr @.str.exp_ns_level8.19)
  %t154 = call i64 @"sx_f64_div"(i64 %t152, i64 %t153)
  %t155 = call i64 @"sin_f64"(i64 %t154)
  %t156 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t155)
  store i64 %t156, ptr %local.u4.94
  %t157 = load i64, ptr %local.u2.92
  %t158 = load i64, ptr %local.chaos_eps
  %t159 = call i64 @"sx_f64_add"(i64 %t157, i64 %t158)
  store i64 %t159, ptr %local.u2.92
  store i64 0, ptr %local.step.95
  %t160 = call i64 @f64_parse(ptr @.str.exp_ns_level8.20)
  store i64 %t160, ptr %local.mg.96
  br label %loop6
loop6:
  %t161 = load i64, ptr %local.step.95
  %t162 = load i64, ptr %local.max_steps
  %t163 = icmp slt i64 %t161, %t162
  %t164 = zext i1 %t163 to i64
  %t165 = icmp ne i64 %t164, 0
  br i1 %t165, label %body6, label %endloop6
body6:
  %t166 = load i64, ptr %local.u0.90
  %t167 = load i64, ptr %local.u1.91
  %t168 = load i64, ptr %local.u2.92
  %t169 = load i64, ptr %local.u3.93
  %t170 = load i64, ptr %local.u4.94
  %t171 = load i64, ptr %local.nu
  %t172 = load i64, ptr %local.dt
  %t173 = load i64, ptr %local.dx
  %t174 = load i64, ptr %local.boundary_damp
  %t175 = call i64 @"step5"(i64 %t166, i64 %t167, i64 %t168, i64 %t169, i64 %t170, i64 %t171, i64 %t172, i64 %t173, i64 0, i64 %t174)
  store i64 %t175, ptr %local.n0.97
  %t176 = load i64, ptr %local.u0.90
  %t177 = load i64, ptr %local.u1.91
  %t178 = load i64, ptr %local.u2.92
  %t179 = load i64, ptr %local.u3.93
  %t180 = load i64, ptr %local.u4.94
  %t181 = load i64, ptr %local.nu
  %t182 = load i64, ptr %local.dt
  %t183 = load i64, ptr %local.dx
  %t184 = load i64, ptr %local.boundary_damp
  %t185 = call i64 @"step5"(i64 %t176, i64 %t177, i64 %t178, i64 %t179, i64 %t180, i64 %t181, i64 %t182, i64 %t183, i64 1, i64 %t184)
  store i64 %t185, ptr %local.n1.98
  %t186 = load i64, ptr %local.u0.90
  %t187 = load i64, ptr %local.u1.91
  %t188 = load i64, ptr %local.u2.92
  %t189 = load i64, ptr %local.u3.93
  %t190 = load i64, ptr %local.u4.94
  %t191 = load i64, ptr %local.nu
  %t192 = load i64, ptr %local.dt
  %t193 = load i64, ptr %local.dx
  %t194 = load i64, ptr %local.boundary_damp
  %t195 = call i64 @"step5"(i64 %t186, i64 %t187, i64 %t188, i64 %t189, i64 %t190, i64 %t191, i64 %t192, i64 %t193, i64 2, i64 %t194)
  store i64 %t195, ptr %local.n2.99
  %t196 = load i64, ptr %local.u0.90
  %t197 = load i64, ptr %local.u1.91
  %t198 = load i64, ptr %local.u2.92
  %t199 = load i64, ptr %local.u3.93
  %t200 = load i64, ptr %local.u4.94
  %t201 = load i64, ptr %local.nu
  %t202 = load i64, ptr %local.dt
  %t203 = load i64, ptr %local.dx
  %t204 = load i64, ptr %local.boundary_damp
  %t205 = call i64 @"step5"(i64 %t196, i64 %t197, i64 %t198, i64 %t199, i64 %t200, i64 %t201, i64 %t202, i64 %t203, i64 3, i64 %t204)
  store i64 %t205, ptr %local.n3.100
  %t206 = load i64, ptr %local.u0.90
  %t207 = load i64, ptr %local.u1.91
  %t208 = load i64, ptr %local.u2.92
  %t209 = load i64, ptr %local.u3.93
  %t210 = load i64, ptr %local.u4.94
  %t211 = load i64, ptr %local.nu
  %t212 = load i64, ptr %local.dt
  %t213 = load i64, ptr %local.dx
  %t214 = load i64, ptr %local.boundary_damp
  %t215 = call i64 @"step5"(i64 %t206, i64 %t207, i64 %t208, i64 %t209, i64 %t210, i64 %t211, i64 %t212, i64 %t213, i64 4, i64 %t214)
  store i64 %t215, ptr %local.n4.101
  %t216 = load i64, ptr %local.n0.97
  store i64 %t216, ptr %local.u0.90
  %t217 = load i64, ptr %local.n1.98
  store i64 %t217, ptr %local.u1.91
  %t218 = load i64, ptr %local.n2.99
  store i64 %t218, ptr %local.u2.92
  %t219 = load i64, ptr %local.n3.100
  store i64 %t219, ptr %local.u3.93
  %t220 = load i64, ptr %local.n4.101
  store i64 %t220, ptr %local.u4.94
  %t221 = load i64, ptr %local.u1.91
  %t222 = load i64, ptr %local.u0.90
  %t223 = call i64 @"sx_f64_sub"(i64 %t221, i64 %t222)
  %t224 = call i64 @"abs_f64"(i64 %t223)
  %t225 = load i64, ptr %local.dx
  %t226 = call i64 @"sx_f64_div"(i64 %t224, i64 %t225)
  store i64 %t226, ptr %local.g01.102
  %t227 = load i64, ptr %local.u2.92
  %t228 = load i64, ptr %local.u1.91
  %t229 = call i64 @"sx_f64_sub"(i64 %t227, i64 %t228)
  %t230 = call i64 @"abs_f64"(i64 %t229)
  %t231 = load i64, ptr %local.dx
  %t232 = call i64 @"sx_f64_div"(i64 %t230, i64 %t231)
  store i64 %t232, ptr %local.g12.103
  %t233 = load i64, ptr %local.u3.93
  %t234 = load i64, ptr %local.u2.92
  %t235 = call i64 @"sx_f64_sub"(i64 %t233, i64 %t234)
  %t236 = call i64 @"abs_f64"(i64 %t235)
  %t237 = load i64, ptr %local.dx
  %t238 = call i64 @"sx_f64_div"(i64 %t236, i64 %t237)
  store i64 %t238, ptr %local.g23.104
  %t239 = load i64, ptr %local.u4.94
  %t240 = load i64, ptr %local.u3.93
  %t241 = call i64 @"sx_f64_sub"(i64 %t239, i64 %t240)
  %t242 = call i64 @"abs_f64"(i64 %t241)
  %t243 = load i64, ptr %local.dx
  %t244 = call i64 @"sx_f64_div"(i64 %t242, i64 %t243)
  store i64 %t244, ptr %local.g34.105
  %t245 = load i64, ptr %local.g01.102
  %t246 = load i64, ptr %local.g12.103
  %t247 = call i64 @"max_f64"(i64 %t245, i64 %t246)
  %t248 = load i64, ptr %local.g23.104
  %t249 = load i64, ptr %local.g34.105
  %t250 = call i64 @"max_f64"(i64 %t248, i64 %t249)
  %t251 = call i64 @"max_f64"(i64 %t247, i64 %t250)
  store i64 %t251, ptr %local.mg.96
  %t252 = load i64, ptr %local.mg.96
  %t253 = load i64, ptr %local.threshold
  %t254 = call i64 @"sx_f64_gt"(i64 %t252, i64 %t253)
  %t255 = icmp ne i64 %t254, 0
  br i1 %t255, label %then7, label %else7
then7:
  %t256 = load i64, ptr %local.step.95
  %t257 = call i64 @"sx_int_to_f64"(i64 %t256)
  ret i64 %t257
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t258 = phi i64 [ 0, %else7_end ]
  %t259 = load i64, ptr %local.mg.96
  %t260 = load i64, ptr %local.mg.96
  %t261 = call i64 @"sx_f64_ne"(i64 %t259, i64 %t260)
  %t262 = icmp ne i64 %t261, 0
  br i1 %t262, label %then8, label %else8
then8:
  %t263 = load i64, ptr %local.step.95
  %t264 = call i64 @"sx_int_to_f64"(i64 %t263)
  ret i64 %t264
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t265 = phi i64 [ 0, %else8_end ]
  %t266 = load i64, ptr %local.step.95
  %t267 = add i64 %t266, 1
  store i64 %t267, ptr %local.step.95
  br label %loop6
endloop6:
  %t268 = load i64, ptr %local.max_steps
  %t269 = call i64 @"sx_int_to_f64"(i64 %t268)
  ret i64 %t269
}

define i64 @"dT_dparam"(i64 %amplitude, i64 %nu, i64 %dt, i64 %dx, i64 %boundary_damp, i64 %chaos_eps, i64 %which, i64 %h, i64 %max_steps, i64 %threshold) nounwind {
entry:
  %local.ap.270 = alloca i64
  %local.np.271 = alloca i64
  %local.dtp.272 = alloca i64
  %local.dxp.273 = alloca i64
  %local.bp.274 = alloca i64
  %local.cp.275 = alloca i64
  %local.am.276 = alloca i64
  %local.nm.277 = alloca i64
  %local.dtm.278 = alloca i64
  %local.dxm.279 = alloca i64
  %local.bm.280 = alloca i64
  %local.cm.281 = alloca i64
  %local.tp.282 = alloca i64
  %local.tm.283 = alloca i64
  %local.amplitude = alloca i64
  store i64 %amplitude, ptr %local.amplitude
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.boundary_damp = alloca i64
  store i64 %boundary_damp, ptr %local.boundary_damp
  %local.chaos_eps = alloca i64
  store i64 %chaos_eps, ptr %local.chaos_eps
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.h = alloca i64
  store i64 %h, ptr %local.h
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %local.threshold = alloca i64
  store i64 %threshold, ptr %local.threshold
  %t284 = load i64, ptr %local.amplitude
  store i64 %t284, ptr %local.ap.270
  %t285 = load i64, ptr %local.nu
  store i64 %t285, ptr %local.np.271
  %t286 = load i64, ptr %local.dt
  store i64 %t286, ptr %local.dtp.272
  %t287 = load i64, ptr %local.dx
  store i64 %t287, ptr %local.dxp.273
  %t288 = load i64, ptr %local.boundary_damp
  store i64 %t288, ptr %local.bp.274
  %t289 = load i64, ptr %local.chaos_eps
  store i64 %t289, ptr %local.cp.275
  %t290 = load i64, ptr %local.amplitude
  store i64 %t290, ptr %local.am.276
  %t291 = load i64, ptr %local.nu
  store i64 %t291, ptr %local.nm.277
  %t292 = load i64, ptr %local.dt
  store i64 %t292, ptr %local.dtm.278
  %t293 = load i64, ptr %local.dx
  store i64 %t293, ptr %local.dxm.279
  %t294 = load i64, ptr %local.boundary_damp
  store i64 %t294, ptr %local.bm.280
  %t295 = load i64, ptr %local.chaos_eps
  store i64 %t295, ptr %local.cm.281
  %t296 = load i64, ptr %local.which
  %t297 = icmp eq i64 %t296, 0
  %t298 = zext i1 %t297 to i64
  %t299 = icmp ne i64 %t298, 0
  br i1 %t299, label %then9, label %else9
then9:
  %t300 = load i64, ptr %local.amplitude
  %t301 = load i64, ptr %local.h
  %t302 = call i64 @"sx_f64_add"(i64 %t300, i64 %t301)
  store i64 %t302, ptr %local.ap.270
  %t303 = load i64, ptr %local.amplitude
  %t304 = load i64, ptr %local.h
  %t305 = call i64 @"sx_f64_sub"(i64 %t303, i64 %t304)
  store i64 %t305, ptr %local.am.276
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t306 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t307 = load i64, ptr %local.which
  %t308 = icmp eq i64 %t307, 1
  %t309 = zext i1 %t308 to i64
  %t310 = icmp ne i64 %t309, 0
  br i1 %t310, label %then10, label %else10
then10:
  %t311 = load i64, ptr %local.nu
  %t312 = load i64, ptr %local.h
  %t313 = call i64 @"sx_f64_add"(i64 %t311, i64 %t312)
  store i64 %t313, ptr %local.np.271
  %t314 = load i64, ptr %local.nu
  %t315 = load i64, ptr %local.h
  %t316 = call i64 @"sx_f64_sub"(i64 %t314, i64 %t315)
  store i64 %t316, ptr %local.nm.277
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t317 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t318 = load i64, ptr %local.which
  %t319 = icmp eq i64 %t318, 2
  %t320 = zext i1 %t319 to i64
  %t321 = icmp ne i64 %t320, 0
  br i1 %t321, label %then11, label %else11
then11:
  %t322 = load i64, ptr %local.dx
  %t323 = load i64, ptr %local.h
  %t324 = call i64 @"sx_f64_add"(i64 %t322, i64 %t323)
  store i64 %t324, ptr %local.dxp.273
  %t325 = load i64, ptr %local.dx
  %t326 = load i64, ptr %local.h
  %t327 = call i64 @"sx_f64_sub"(i64 %t325, i64 %t326)
  store i64 %t327, ptr %local.dxm.279
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t328 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t329 = load i64, ptr %local.which
  %t330 = icmp eq i64 %t329, 3
  %t331 = zext i1 %t330 to i64
  %t332 = icmp ne i64 %t331, 0
  br i1 %t332, label %then12, label %else12
then12:
  %t333 = load i64, ptr %local.boundary_damp
  %t334 = load i64, ptr %local.h
  %t335 = call i64 @"sx_f64_add"(i64 %t333, i64 %t334)
  store i64 %t335, ptr %local.bp.274
  %t336 = load i64, ptr %local.boundary_damp
  %t337 = load i64, ptr %local.h
  %t338 = call i64 @"sx_f64_sub"(i64 %t336, i64 %t337)
  store i64 %t338, ptr %local.bm.280
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t339 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t340 = load i64, ptr %local.which
  %t341 = icmp eq i64 %t340, 4
  %t342 = zext i1 %t341 to i64
  %t343 = icmp ne i64 %t342, 0
  br i1 %t343, label %then13, label %else13
then13:
  %t344 = load i64, ptr %local.chaos_eps
  %t345 = load i64, ptr %local.h
  %t346 = call i64 @"sx_f64_add"(i64 %t344, i64 %t345)
  store i64 %t346, ptr %local.cp.275
  %t347 = load i64, ptr %local.chaos_eps
  %t348 = load i64, ptr %local.h
  %t349 = call i64 @"sx_f64_sub"(i64 %t347, i64 %t348)
  store i64 %t349, ptr %local.cm.281
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t350 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t351 = load i64, ptr %local.ap.270
  %t352 = load i64, ptr %local.np.271
  %t353 = load i64, ptr %local.dtp.272
  %t354 = load i64, ptr %local.dxp.273
  %t355 = load i64, ptr %local.bp.274
  %t356 = load i64, ptr %local.cp.275
  %t357 = load i64, ptr %local.max_steps
  %t358 = load i64, ptr %local.threshold
  %t359 = call i64 @"blowup_time"(i64 %t351, i64 %t352, i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 %t357, i64 %t358)
  store i64 %t359, ptr %local.tp.282
  %t360 = load i64, ptr %local.am.276
  %t361 = load i64, ptr %local.nm.277
  %t362 = load i64, ptr %local.dtm.278
  %t363 = load i64, ptr %local.dxm.279
  %t364 = load i64, ptr %local.bm.280
  %t365 = load i64, ptr %local.cm.281
  %t366 = load i64, ptr %local.max_steps
  %t367 = load i64, ptr %local.threshold
  %t368 = call i64 @"blowup_time"(i64 %t360, i64 %t361, i64 %t362, i64 %t363, i64 %t364, i64 %t365, i64 %t366, i64 %t367)
  store i64 %t368, ptr %local.tm.283
  %t369 = load i64, ptr %local.tp.282
  %t370 = load i64, ptr %local.tm.283
  %t371 = call i64 @"sx_f64_sub"(i64 %t369, i64 %t370)
  %t372 = call i64 @f64_parse(ptr @.str.exp_ns_level8.21)
  %t373 = load i64, ptr %local.h
  %t374 = call i64 @"sx_f64_mul"(i64 %t372, i64 %t373)
  %t375 = call i64 @"sx_f64_div"(i64 %t371, i64 %t374)
  ret i64 %t375
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.max_steps.376 = alloca i64
  %local.threshold.377 = alloca i64
  %local.base_dt.378 = alloca i64
  %local.nu.379 = alloca i64
  %local.tb.380 = alloca i64
  %local.dt_dnu.381 = alloca i64
  %local.amp.382 = alloca i64
  %local.tb.383 = alloca i64
  %local.dt_da.384 = alloca i64
  %local.ddx.385 = alloca i64
  %local.tb.386 = alloca i64
  %local.dt_ddx.387 = alloca i64
  %local.bd.388 = alloca i64
  %local.tb.389 = alloca i64
  %local.dt_db.390 = alloca i64
  %local.ce.391 = alloca i64
  %local.tb.392 = alloca i64
  %local.dt_de.393 = alloca i64
  %t394 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.22)
  %t395 = ptrtoint ptr %t394 to i64
  %t396 = inttoptr i64 %t395 to ptr
  call void @intrinsic_println(ptr %t396)
  %t397 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.23)
  %t398 = ptrtoint ptr %t397 to i64
  %t399 = inttoptr i64 %t398 to ptr
  call void @intrinsic_println(ptr %t399)
  %t400 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.24)
  %t401 = ptrtoint ptr %t400 to i64
  %t402 = inttoptr i64 %t401 to ptr
  call void @intrinsic_println(ptr %t402)
  %t403 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.25)
  %t404 = ptrtoint ptr %t403 to i64
  %t405 = inttoptr i64 %t404 to ptr
  call void @intrinsic_println(ptr %t405)
  %t406 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.26)
  %t407 = ptrtoint ptr %t406 to i64
  %t408 = inttoptr i64 %t407 to ptr
  call void @intrinsic_println(ptr %t408)
  store i64 50000, ptr %local.max_steps.376
  %t409 = call i64 @f64_parse(ptr @.str.exp_ns_level8.27)
  store i64 %t409, ptr %local.threshold.377
  %t410 = call i64 @f64_parse(ptr @.str.exp_ns_level8.28)
  store i64 %t410, ptr %local.base_dt.378
  %t411 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.29)
  %t412 = ptrtoint ptr %t411 to i64
  %t413 = inttoptr i64 %t412 to ptr
  call void @intrinsic_println(ptr %t413)
  %t414 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.30)
  %t415 = ptrtoint ptr %t414 to i64
  %t416 = inttoptr i64 %t415 to ptr
  call void @intrinsic_println(ptr %t416)
  %t417 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.31)
  %t418 = ptrtoint ptr %t417 to i64
  %t419 = inttoptr i64 %t418 to ptr
  call void @intrinsic_println(ptr %t419)
  %t420 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.32)
  %t421 = ptrtoint ptr %t420 to i64
  %t422 = inttoptr i64 %t421 to ptr
  call void @intrinsic_println(ptr %t422)
  %t423 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.33)
  %t424 = ptrtoint ptr %t423 to i64
  %t425 = inttoptr i64 %t424 to ptr
  call void @intrinsic_println(ptr %t425)
  %t426 = call i64 @f64_parse(ptr @.str.exp_ns_level8.34)
  store i64 %t426, ptr %local.nu.379
  br label %loop14
loop14:
  %t427 = load i64, ptr %local.nu.379
  %t428 = call i64 @f64_parse(ptr @.str.exp_ns_level8.35)
  %t429 = call i64 @"sx_f64_le"(i64 %t427, i64 %t428)
  %t430 = icmp ne i64 %t429, 0
  br i1 %t430, label %body14, label %endloop14
body14:
  %t431 = call i64 @f64_parse(ptr @.str.exp_ns_level8.36)
  %t432 = load i64, ptr %local.nu.379
  %t433 = load i64, ptr %local.base_dt.378
  %t434 = call i64 @f64_parse(ptr @.str.exp_ns_level8.37)
  %t435 = call i64 @f64_parse(ptr @.str.exp_ns_level8.38)
  %t436 = call i64 @f64_parse(ptr @.str.exp_ns_level8.39)
  %t437 = load i64, ptr %local.max_steps.376
  %t438 = load i64, ptr %local.threshold.377
  %t439 = call i64 @"blowup_time"(i64 %t431, i64 %t432, i64 %t433, i64 %t434, i64 %t435, i64 %t436, i64 %t437, i64 %t438)
  store i64 %t439, ptr %local.tb.380
  %t440 = call i64 @f64_parse(ptr @.str.exp_ns_level8.40)
  %t441 = load i64, ptr %local.nu.379
  %t442 = load i64, ptr %local.base_dt.378
  %t443 = call i64 @f64_parse(ptr @.str.exp_ns_level8.41)
  %t444 = call i64 @f64_parse(ptr @.str.exp_ns_level8.42)
  %t445 = call i64 @f64_parse(ptr @.str.exp_ns_level8.43)
  %t446 = call i64 @f64_parse(ptr @.str.exp_ns_level8.44)
  %t447 = load i64, ptr %local.max_steps.376
  %t448 = load i64, ptr %local.threshold.377
  %t449 = call i64 @"dT_dparam"(i64 %t440, i64 %t441, i64 %t442, i64 %t443, i64 %t444, i64 %t445, i64 1, i64 %t446, i64 %t447, i64 %t448)
  store i64 %t449, ptr %local.dt_dnu.381
  %t450 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.45)
  %t451 = ptrtoint ptr %t450 to i64
  %t452 = inttoptr i64 %t451 to ptr
  call void @intrinsic_print(ptr %t452)
  %t453 = load i64, ptr %local.nu.379
  %t454 = call i64 @"print_f64"(i64 %t453)
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.46)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_print(ptr %t457)
  %t458 = load i64, ptr %local.tb.380
  %t459 = call i64 @"print_f64"(i64 %t458)
  %t460 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.47)
  %t461 = ptrtoint ptr %t460 to i64
  %t462 = inttoptr i64 %t461 to ptr
  call void @intrinsic_print(ptr %t462)
  %t463 = load i64, ptr %local.dt_dnu.381
  %t464 = call i64 @"print_f64"(i64 %t463)
  %t465 = load i64, ptr %local.tb.380
  %t466 = load i64, ptr %local.max_steps.376
  %t467 = call i64 @"sx_int_to_f64"(i64 %t466)
  %t468 = call i64 @"sx_f64_ge"(i64 %t465, i64 %t467)
  %t469 = icmp ne i64 %t468, 0
  br i1 %t469, label %then15, label %else15
then15:
  %t470 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.48)
  %t471 = ptrtoint ptr %t470 to i64
  %t472 = inttoptr i64 %t471 to ptr
  call void @intrinsic_println(ptr %t472)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t473 = load i64, ptr %local.dt_dnu.381
  %t474 = call i64 @"abs_f64"(i64 %t473)
  %t475 = call i64 @f64_parse(ptr @.str.exp_ns_level8.49)
  %t476 = call i64 @"sx_f64_gt"(i64 %t474, i64 %t475)
  %t477 = icmp ne i64 %t476, 0
  br i1 %t477, label %then16, label %else16
then16:
  %t478 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.50)
  %t479 = ptrtoint ptr %t478 to i64
  %t480 = inttoptr i64 %t479 to ptr
  call void @intrinsic_println(ptr %t480)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t481 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.51)
  %t482 = ptrtoint ptr %t481 to i64
  %t483 = inttoptr i64 %t482 to ptr
  call void @intrinsic_println(ptr %t483)
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t484 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t485 = phi i64 [ 0, %then15_end ], [ %t484, %else15_end ]
  %t486 = load i64, ptr %local.nu.379
  %t487 = call i64 @f64_parse(ptr @.str.exp_ns_level8.52)
  %t488 = call i64 @"sx_f64_add"(i64 %t486, i64 %t487)
  store i64 %t488, ptr %local.nu.379
  br label %loop14
endloop14:
  %t489 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.53)
  %t490 = ptrtoint ptr %t489 to i64
  %t491 = inttoptr i64 %t490 to ptr
  call void @intrinsic_println(ptr %t491)
  %t492 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.54)
  %t493 = ptrtoint ptr %t492 to i64
  %t494 = inttoptr i64 %t493 to ptr
  call void @intrinsic_println(ptr %t494)
  %t495 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.55)
  %t496 = ptrtoint ptr %t495 to i64
  %t497 = inttoptr i64 %t496 to ptr
  call void @intrinsic_println(ptr %t497)
  %t498 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.56)
  %t499 = ptrtoint ptr %t498 to i64
  %t500 = inttoptr i64 %t499 to ptr
  call void @intrinsic_println(ptr %t500)
  %t501 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.57)
  %t502 = ptrtoint ptr %t501 to i64
  %t503 = inttoptr i64 %t502 to ptr
  call void @intrinsic_println(ptr %t503)
  %t504 = call i64 @f64_parse(ptr @.str.exp_ns_level8.58)
  store i64 %t504, ptr %local.amp.382
  br label %loop17
loop17:
  %t505 = load i64, ptr %local.amp.382
  %t506 = call i64 @f64_parse(ptr @.str.exp_ns_level8.59)
  %t507 = call i64 @"sx_f64_le"(i64 %t505, i64 %t506)
  %t508 = icmp ne i64 %t507, 0
  br i1 %t508, label %body17, label %endloop17
body17:
  %t509 = load i64, ptr %local.amp.382
  %t510 = call i64 @f64_parse(ptr @.str.exp_ns_level8.60)
  %t511 = load i64, ptr %local.base_dt.378
  %t512 = call i64 @f64_parse(ptr @.str.exp_ns_level8.61)
  %t513 = call i64 @f64_parse(ptr @.str.exp_ns_level8.62)
  %t514 = call i64 @f64_parse(ptr @.str.exp_ns_level8.63)
  %t515 = load i64, ptr %local.max_steps.376
  %t516 = load i64, ptr %local.threshold.377
  %t517 = call i64 @"blowup_time"(i64 %t509, i64 %t510, i64 %t511, i64 %t512, i64 %t513, i64 %t514, i64 %t515, i64 %t516)
  store i64 %t517, ptr %local.tb.383
  %t518 = load i64, ptr %local.amp.382
  %t519 = call i64 @f64_parse(ptr @.str.exp_ns_level8.64)
  %t520 = load i64, ptr %local.base_dt.378
  %t521 = call i64 @f64_parse(ptr @.str.exp_ns_level8.65)
  %t522 = call i64 @f64_parse(ptr @.str.exp_ns_level8.66)
  %t523 = call i64 @f64_parse(ptr @.str.exp_ns_level8.67)
  %t524 = call i64 @f64_parse(ptr @.str.exp_ns_level8.68)
  %t525 = load i64, ptr %local.max_steps.376
  %t526 = load i64, ptr %local.threshold.377
  %t527 = call i64 @"dT_dparam"(i64 %t518, i64 %t519, i64 %t520, i64 %t521, i64 %t522, i64 %t523, i64 0, i64 %t524, i64 %t525, i64 %t526)
  store i64 %t527, ptr %local.dt_da.384
  %t528 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.69)
  %t529 = ptrtoint ptr %t528 to i64
  %t530 = inttoptr i64 %t529 to ptr
  call void @intrinsic_print(ptr %t530)
  %t531 = load i64, ptr %local.amp.382
  %t532 = call i64 @"print_f64"(i64 %t531)
  %t533 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.70)
  %t534 = ptrtoint ptr %t533 to i64
  %t535 = inttoptr i64 %t534 to ptr
  call void @intrinsic_print(ptr %t535)
  %t536 = load i64, ptr %local.tb.383
  %t537 = call i64 @"print_f64"(i64 %t536)
  %t538 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.71)
  %t539 = ptrtoint ptr %t538 to i64
  %t540 = inttoptr i64 %t539 to ptr
  call void @intrinsic_print(ptr %t540)
  %t541 = load i64, ptr %local.dt_da.384
  %t542 = call i64 @"print_f64"(i64 %t541)
  %t543 = load i64, ptr %local.tb.383
  %t544 = load i64, ptr %local.max_steps.376
  %t545 = call i64 @"sx_int_to_f64"(i64 %t544)
  %t546 = call i64 @"sx_f64_ge"(i64 %t543, i64 %t545)
  %t547 = icmp ne i64 %t546, 0
  br i1 %t547, label %then18, label %else18
then18:
  %t548 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.72)
  %t549 = ptrtoint ptr %t548 to i64
  %t550 = inttoptr i64 %t549 to ptr
  call void @intrinsic_println(ptr %t550)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t551 = load i64, ptr %local.dt_da.384
  %t552 = call i64 @"abs_f64"(i64 %t551)
  %t553 = call i64 @f64_parse(ptr @.str.exp_ns_level8.73)
  %t554 = call i64 @"sx_f64_gt"(i64 %t552, i64 %t553)
  %t555 = icmp ne i64 %t554, 0
  br i1 %t555, label %then19, label %else19
then19:
  %t556 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.74)
  %t557 = ptrtoint ptr %t556 to i64
  %t558 = inttoptr i64 %t557 to ptr
  call void @intrinsic_println(ptr %t558)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t559 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.75)
  %t560 = ptrtoint ptr %t559 to i64
  %t561 = inttoptr i64 %t560 to ptr
  call void @intrinsic_println(ptr %t561)
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t562 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t563 = phi i64 [ 0, %then18_end ], [ %t562, %else18_end ]
  %t564 = load i64, ptr %local.amp.382
  %t565 = call i64 @f64_parse(ptr @.str.exp_ns_level8.76)
  %t566 = call i64 @"sx_f64_add"(i64 %t564, i64 %t565)
  store i64 %t566, ptr %local.amp.382
  br label %loop17
endloop17:
  %t567 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.77)
  %t568 = ptrtoint ptr %t567 to i64
  %t569 = inttoptr i64 %t568 to ptr
  call void @intrinsic_println(ptr %t569)
  %t570 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.78)
  %t571 = ptrtoint ptr %t570 to i64
  %t572 = inttoptr i64 %t571 to ptr
  call void @intrinsic_println(ptr %t572)
  %t573 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.79)
  %t574 = ptrtoint ptr %t573 to i64
  %t575 = inttoptr i64 %t574 to ptr
  call void @intrinsic_println(ptr %t575)
  %t576 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.80)
  %t577 = ptrtoint ptr %t576 to i64
  %t578 = inttoptr i64 %t577 to ptr
  call void @intrinsic_println(ptr %t578)
  %t579 = call i64 @f64_parse(ptr @.str.exp_ns_level8.81)
  store i64 %t579, ptr %local.ddx.385
  br label %loop20
loop20:
  %t580 = load i64, ptr %local.ddx.385
  %t581 = call i64 @f64_parse(ptr @.str.exp_ns_level8.82)
  %t582 = call i64 @"sx_f64_le"(i64 %t580, i64 %t581)
  %t583 = icmp ne i64 %t582, 0
  br i1 %t583, label %body20, label %endloop20
body20:
  %t584 = call i64 @f64_parse(ptr @.str.exp_ns_level8.83)
  %t585 = call i64 @f64_parse(ptr @.str.exp_ns_level8.84)
  %t586 = load i64, ptr %local.base_dt.378
  %t587 = load i64, ptr %local.ddx.385
  %t588 = call i64 @f64_parse(ptr @.str.exp_ns_level8.85)
  %t589 = call i64 @f64_parse(ptr @.str.exp_ns_level8.86)
  %t590 = load i64, ptr %local.max_steps.376
  %t591 = load i64, ptr %local.threshold.377
  %t592 = call i64 @"blowup_time"(i64 %t584, i64 %t585, i64 %t586, i64 %t587, i64 %t588, i64 %t589, i64 %t590, i64 %t591)
  store i64 %t592, ptr %local.tb.386
  %t593 = call i64 @f64_parse(ptr @.str.exp_ns_level8.87)
  %t594 = call i64 @f64_parse(ptr @.str.exp_ns_level8.88)
  %t595 = load i64, ptr %local.base_dt.378
  %t596 = load i64, ptr %local.ddx.385
  %t597 = call i64 @f64_parse(ptr @.str.exp_ns_level8.89)
  %t598 = call i64 @f64_parse(ptr @.str.exp_ns_level8.90)
  %t599 = call i64 @f64_parse(ptr @.str.exp_ns_level8.91)
  %t600 = load i64, ptr %local.max_steps.376
  %t601 = load i64, ptr %local.threshold.377
  %t602 = call i64 @"dT_dparam"(i64 %t593, i64 %t594, i64 %t595, i64 %t596, i64 %t597, i64 %t598, i64 2, i64 %t599, i64 %t600, i64 %t601)
  store i64 %t602, ptr %local.dt_ddx.387
  %t603 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.92)
  %t604 = ptrtoint ptr %t603 to i64
  %t605 = inttoptr i64 %t604 to ptr
  call void @intrinsic_print(ptr %t605)
  %t606 = load i64, ptr %local.ddx.385
  %t607 = call i64 @"print_f64"(i64 %t606)
  %t608 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.93)
  %t609 = ptrtoint ptr %t608 to i64
  %t610 = inttoptr i64 %t609 to ptr
  call void @intrinsic_print(ptr %t610)
  %t611 = load i64, ptr %local.tb.386
  %t612 = call i64 @"print_f64"(i64 %t611)
  %t613 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.94)
  %t614 = ptrtoint ptr %t613 to i64
  %t615 = inttoptr i64 %t614 to ptr
  call void @intrinsic_print(ptr %t615)
  %t616 = load i64, ptr %local.dt_ddx.387
  %t617 = call i64 @"print_f64"(i64 %t616)
  %t618 = load i64, ptr %local.dt_ddx.387
  %t619 = call i64 @f64_parse(ptr @.str.exp_ns_level8.95)
  %t620 = call i64 @"sx_f64_gt"(i64 %t618, i64 %t619)
  %t621 = icmp ne i64 %t620, 0
  br i1 %t621, label %then21, label %else21
then21:
  %t622 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.96)
  %t623 = ptrtoint ptr %t622 to i64
  %t624 = inttoptr i64 %t623 to ptr
  call void @intrinsic_println(ptr %t624)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t625 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.97)
  %t626 = ptrtoint ptr %t625 to i64
  %t627 = inttoptr i64 %t626 to ptr
  call void @intrinsic_println(ptr %t627)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t628 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t629 = load i64, ptr %local.ddx.385
  %t630 = call i64 @f64_parse(ptr @.str.exp_ns_level8.98)
  %t631 = call i64 @"sx_f64_add"(i64 %t629, i64 %t630)
  store i64 %t631, ptr %local.ddx.385
  br label %loop20
endloop20:
  %t632 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.99)
  %t633 = ptrtoint ptr %t632 to i64
  %t634 = inttoptr i64 %t633 to ptr
  call void @intrinsic_println(ptr %t634)
  %t635 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.100)
  %t636 = ptrtoint ptr %t635 to i64
  %t637 = inttoptr i64 %t636 to ptr
  call void @intrinsic_println(ptr %t637)
  %t638 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.101)
  %t639 = ptrtoint ptr %t638 to i64
  %t640 = inttoptr i64 %t639 to ptr
  call void @intrinsic_println(ptr %t640)
  %t641 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.102)
  %t642 = ptrtoint ptr %t641 to i64
  %t643 = inttoptr i64 %t642 to ptr
  call void @intrinsic_println(ptr %t643)
  %t644 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.103)
  %t645 = ptrtoint ptr %t644 to i64
  %t646 = inttoptr i64 %t645 to ptr
  call void @intrinsic_println(ptr %t646)
  %t647 = call i64 @f64_parse(ptr @.str.exp_ns_level8.104)
  store i64 %t647, ptr %local.bd.388
  br label %loop22
loop22:
  %t648 = load i64, ptr %local.bd.388
  %t649 = call i64 @f64_parse(ptr @.str.exp_ns_level8.105)
  %t650 = call i64 @"sx_f64_le"(i64 %t648, i64 %t649)
  %t651 = icmp ne i64 %t650, 0
  br i1 %t651, label %body22, label %endloop22
body22:
  %t652 = call i64 @f64_parse(ptr @.str.exp_ns_level8.106)
  %t653 = call i64 @f64_parse(ptr @.str.exp_ns_level8.107)
  %t654 = load i64, ptr %local.base_dt.378
  %t655 = call i64 @f64_parse(ptr @.str.exp_ns_level8.108)
  %t656 = load i64, ptr %local.bd.388
  %t657 = call i64 @f64_parse(ptr @.str.exp_ns_level8.109)
  %t658 = load i64, ptr %local.max_steps.376
  %t659 = load i64, ptr %local.threshold.377
  %t660 = call i64 @"blowup_time"(i64 %t652, i64 %t653, i64 %t654, i64 %t655, i64 %t656, i64 %t657, i64 %t658, i64 %t659)
  store i64 %t660, ptr %local.tb.389
  %t661 = call i64 @f64_parse(ptr @.str.exp_ns_level8.110)
  %t662 = call i64 @f64_parse(ptr @.str.exp_ns_level8.111)
  %t663 = load i64, ptr %local.base_dt.378
  %t664 = call i64 @f64_parse(ptr @.str.exp_ns_level8.112)
  %t665 = load i64, ptr %local.bd.388
  %t666 = call i64 @f64_parse(ptr @.str.exp_ns_level8.113)
  %t667 = call i64 @f64_parse(ptr @.str.exp_ns_level8.114)
  %t668 = load i64, ptr %local.max_steps.376
  %t669 = load i64, ptr %local.threshold.377
  %t670 = call i64 @"dT_dparam"(i64 %t661, i64 %t662, i64 %t663, i64 %t664, i64 %t665, i64 %t666, i64 3, i64 %t667, i64 %t668, i64 %t669)
  store i64 %t670, ptr %local.dt_db.390
  %t671 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.115)
  %t672 = ptrtoint ptr %t671 to i64
  %t673 = inttoptr i64 %t672 to ptr
  call void @intrinsic_print(ptr %t673)
  %t674 = load i64, ptr %local.bd.388
  %t675 = call i64 @"print_f64"(i64 %t674)
  %t676 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.116)
  %t677 = ptrtoint ptr %t676 to i64
  %t678 = inttoptr i64 %t677 to ptr
  call void @intrinsic_print(ptr %t678)
  %t679 = load i64, ptr %local.tb.389
  %t680 = call i64 @"print_f64"(i64 %t679)
  %t681 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.117)
  %t682 = ptrtoint ptr %t681 to i64
  %t683 = inttoptr i64 %t682 to ptr
  call void @intrinsic_print(ptr %t683)
  %t684 = load i64, ptr %local.dt_db.390
  %t685 = call i64 @"print_f64"(i64 %t684)
  %t686 = load i64, ptr %local.dt_db.390
  %t687 = call i64 @f64_parse(ptr @.str.exp_ns_level8.118)
  %t688 = call i64 @"sx_f64_lt"(i64 %t686, i64 %t687)
  %t689 = icmp ne i64 %t688, 0
  br i1 %t689, label %then23, label %else23
then23:
  %t690 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.119)
  %t691 = ptrtoint ptr %t690 to i64
  %t692 = inttoptr i64 %t691 to ptr
  call void @intrinsic_println(ptr %t692)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t693 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.120)
  %t694 = ptrtoint ptr %t693 to i64
  %t695 = inttoptr i64 %t694 to ptr
  call void @intrinsic_println(ptr %t695)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t696 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t697 = load i64, ptr %local.bd.388
  %t698 = call i64 @f64_parse(ptr @.str.exp_ns_level8.121)
  %t699 = call i64 @"sx_f64_add"(i64 %t697, i64 %t698)
  store i64 %t699, ptr %local.bd.388
  br label %loop22
endloop22:
  %t700 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.122)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_println(ptr %t702)
  %t703 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.123)
  %t704 = ptrtoint ptr %t703 to i64
  %t705 = inttoptr i64 %t704 to ptr
  call void @intrinsic_println(ptr %t705)
  %t706 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.124)
  %t707 = ptrtoint ptr %t706 to i64
  %t708 = inttoptr i64 %t707 to ptr
  call void @intrinsic_println(ptr %t708)
  %t709 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.125)
  %t710 = ptrtoint ptr %t709 to i64
  %t711 = inttoptr i64 %t710 to ptr
  call void @intrinsic_println(ptr %t711)
  %t712 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.126)
  %t713 = ptrtoint ptr %t712 to i64
  %t714 = inttoptr i64 %t713 to ptr
  call void @intrinsic_println(ptr %t714)
  %t715 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.127)
  %t716 = ptrtoint ptr %t715 to i64
  %t717 = inttoptr i64 %t716 to ptr
  call void @intrinsic_println(ptr %t717)
  %t718 = call i64 @f64_parse(ptr @.str.exp_ns_level8.128)
  store i64 %t718, ptr %local.ce.391
  br label %loop24
loop24:
  %t719 = load i64, ptr %local.ce.391
  %t720 = call i64 @f64_parse(ptr @.str.exp_ns_level8.129)
  %t721 = call i64 @"sx_f64_le"(i64 %t719, i64 %t720)
  %t722 = icmp ne i64 %t721, 0
  br i1 %t722, label %body24, label %endloop24
body24:
  %t723 = call i64 @f64_parse(ptr @.str.exp_ns_level8.130)
  %t724 = call i64 @f64_parse(ptr @.str.exp_ns_level8.131)
  %t725 = load i64, ptr %local.base_dt.378
  %t726 = call i64 @f64_parse(ptr @.str.exp_ns_level8.132)
  %t727 = call i64 @f64_parse(ptr @.str.exp_ns_level8.133)
  %t728 = load i64, ptr %local.ce.391
  %t729 = load i64, ptr %local.max_steps.376
  %t730 = load i64, ptr %local.threshold.377
  %t731 = call i64 @"blowup_time"(i64 %t723, i64 %t724, i64 %t725, i64 %t726, i64 %t727, i64 %t728, i64 %t729, i64 %t730)
  store i64 %t731, ptr %local.tb.392
  %t732 = call i64 @f64_parse(ptr @.str.exp_ns_level8.134)
  store i64 %t732, ptr %local.dt_de.393
  %t733 = load i64, ptr %local.ce.391
  %t734 = call i64 @f64_parse(ptr @.str.exp_ns_level8.135)
  %t735 = call i64 @"sx_f64_gt"(i64 %t733, i64 %t734)
  %t736 = icmp ne i64 %t735, 0
  br i1 %t736, label %then25, label %else25
then25:
  %t737 = call i64 @f64_parse(ptr @.str.exp_ns_level8.136)
  %t738 = call i64 @f64_parse(ptr @.str.exp_ns_level8.137)
  %t739 = load i64, ptr %local.base_dt.378
  %t740 = call i64 @f64_parse(ptr @.str.exp_ns_level8.138)
  %t741 = call i64 @f64_parse(ptr @.str.exp_ns_level8.139)
  %t742 = load i64, ptr %local.ce.391
  %t743 = call i64 @f64_parse(ptr @.str.exp_ns_level8.140)
  %t744 = load i64, ptr %local.max_steps.376
  %t745 = load i64, ptr %local.threshold.377
  %t746 = call i64 @"dT_dparam"(i64 %t737, i64 %t738, i64 %t739, i64 %t740, i64 %t741, i64 %t742, i64 4, i64 %t743, i64 %t744, i64 %t745)
  store i64 %t746, ptr %local.dt_de.393
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t747 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t748 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.141)
  %t749 = ptrtoint ptr %t748 to i64
  %t750 = inttoptr i64 %t749 to ptr
  call void @intrinsic_print(ptr %t750)
  %t751 = load i64, ptr %local.ce.391
  %t752 = call i64 @"print_f64"(i64 %t751)
  %t753 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.142)
  %t754 = ptrtoint ptr %t753 to i64
  %t755 = inttoptr i64 %t754 to ptr
  call void @intrinsic_print(ptr %t755)
  %t756 = load i64, ptr %local.tb.392
  %t757 = call i64 @"print_f64"(i64 %t756)
  %t758 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.143)
  %t759 = ptrtoint ptr %t758 to i64
  %t760 = inttoptr i64 %t759 to ptr
  call void @intrinsic_print(ptr %t760)
  %t761 = load i64, ptr %local.dt_de.393
  %t762 = call i64 @"print_f64"(i64 %t761)
  %t763 = load i64, ptr %local.dt_de.393
  %t764 = call i64 @f64_parse(ptr @.str.exp_ns_level8.144)
  %t765 = call i64 @f64_parse(ptr @.str.exp_ns_level8.145)
  %t766 = call i64 @"sx_f64_sub"(i64 %t764, i64 %t765)
  %t767 = call i64 @"sx_f64_lt"(i64 %t763, i64 %t766)
  %t768 = icmp ne i64 %t767, 0
  br i1 %t768, label %then26, label %else26
then26:
  %t769 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.146)
  %t770 = ptrtoint ptr %t769 to i64
  %t771 = inttoptr i64 %t770 to ptr
  call void @intrinsic_println(ptr %t771)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t772 = load i64, ptr %local.dt_de.393
  %t773 = call i64 @f64_parse(ptr @.str.exp_ns_level8.147)
  %t774 = call i64 @"sx_f64_lt"(i64 %t772, i64 %t773)
  %t775 = icmp ne i64 %t774, 0
  br i1 %t775, label %then27, label %else27
then27:
  %t776 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.148)
  %t777 = ptrtoint ptr %t776 to i64
  %t778 = inttoptr i64 %t777 to ptr
  call void @intrinsic_println(ptr %t778)
  br label %then27_end
then27_end:
  br label %endif27
else27:
  %t779 = load i64, ptr %local.dt_de.393
  %t780 = call i64 @f64_parse(ptr @.str.exp_ns_level8.149)
  %t781 = call i64 @"sx_f64_gt"(i64 %t779, i64 %t780)
  %t782 = icmp ne i64 %t781, 0
  br i1 %t782, label %then28, label %else28
then28:
  %t783 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.150)
  %t784 = ptrtoint ptr %t783 to i64
  %t785 = inttoptr i64 %t784 to ptr
  call void @intrinsic_println(ptr %t785)
  br label %then28_end
then28_end:
  br label %endif28
else28:
  %t786 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.151)
  %t787 = ptrtoint ptr %t786 to i64
  %t788 = inttoptr i64 %t787 to ptr
  call void @intrinsic_println(ptr %t788)
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t789 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t790 = phi i64 [ 0, %then27_end ], [ %t789, %else27_end ]
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t791 = phi i64 [ 0, %then26_end ], [ %t790, %else26_end ]
  %t792 = load i64, ptr %local.ce.391
  %t793 = call i64 @f64_parse(ptr @.str.exp_ns_level8.152)
  %t794 = call i64 @"sx_f64_add"(i64 %t792, i64 %t793)
  store i64 %t794, ptr %local.ce.391
  br label %loop24
endloop24:
  %t795 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.153)
  %t796 = ptrtoint ptr %t795 to i64
  %t797 = inttoptr i64 %t796 to ptr
  call void @intrinsic_println(ptr %t797)
  %t798 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.154)
  %t799 = ptrtoint ptr %t798 to i64
  %t800 = inttoptr i64 %t799 to ptr
  call void @intrinsic_println(ptr %t800)
  %t801 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.155)
  %t802 = ptrtoint ptr %t801 to i64
  %t803 = inttoptr i64 %t802 to ptr
  call void @intrinsic_println(ptr %t803)
  %t804 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.156)
  %t805 = ptrtoint ptr %t804 to i64
  %t806 = inttoptr i64 %t805 to ptr
  call void @intrinsic_println(ptr %t806)
  %t807 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.157)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_println(ptr %t809)
  %t810 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.158)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_println(ptr %t812)
  %t813 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.159)
  %t814 = ptrtoint ptr %t813 to i64
  %t815 = inttoptr i64 %t814 to ptr
  call void @intrinsic_println(ptr %t815)
  %t816 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.160)
  %t817 = ptrtoint ptr %t816 to i64
  %t818 = inttoptr i64 %t817 to ptr
  call void @intrinsic_println(ptr %t818)
  %t819 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.161)
  %t820 = ptrtoint ptr %t819 to i64
  %t821 = inttoptr i64 %t820 to ptr
  call void @intrinsic_println(ptr %t821)
  %t822 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.162)
  %t823 = ptrtoint ptr %t822 to i64
  %t824 = inttoptr i64 %t823 to ptr
  call void @intrinsic_println(ptr %t824)
  %t825 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.163)
  %t826 = ptrtoint ptr %t825 to i64
  %t827 = inttoptr i64 %t826 to ptr
  call void @intrinsic_println(ptr %t827)
  %t828 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.164)
  %t829 = ptrtoint ptr %t828 to i64
  %t830 = inttoptr i64 %t829 to ptr
  call void @intrinsic_println(ptr %t830)
  %t831 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.165)
  %t832 = ptrtoint ptr %t831 to i64
  %t833 = inttoptr i64 %t832 to ptr
  call void @intrinsic_println(ptr %t833)
  %t834 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.166)
  %t835 = ptrtoint ptr %t834 to i64
  %t836 = inttoptr i64 %t835 to ptr
  call void @intrinsic_println(ptr %t836)
  %t837 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.167)
  %t838 = ptrtoint ptr %t837 to i64
  %t839 = inttoptr i64 %t838 to ptr
  call void @intrinsic_println(ptr %t839)
  %t840 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.168)
  %t841 = ptrtoint ptr %t840 to i64
  %t842 = inttoptr i64 %t841 to ptr
  call void @intrinsic_println(ptr %t842)
  %t843 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.169)
  %t844 = ptrtoint ptr %t843 to i64
  %t845 = inttoptr i64 %t844 to ptr
  call void @intrinsic_println(ptr %t845)
  %t846 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.170)
  %t847 = ptrtoint ptr %t846 to i64
  %t848 = inttoptr i64 %t847 to ptr
  call void @intrinsic_println(ptr %t848)
  %t849 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_level8.171)
  %t850 = ptrtoint ptr %t849 to i64
  %t851 = inttoptr i64 %t850 to ptr
  call void @intrinsic_println(ptr %t851)
  ret i64 0
}


; String constants
@.str.exp_ns_level8.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.4 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_level8.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.7 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_level8.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.10 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_level8.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.13 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_level8.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.15 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_ns_level8.16 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_level8.17 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.18 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_level8.19 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_level8.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.21 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_level8.22 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_level8.23 = private unnamed_addr constant [45 x i8] c"#  LEVEL 8: ALL PARAMETERS ARE DUAL NUMBERS#\00"
@.str.exp_ns_level8.24 = private unnamed_addr constant [49 x i8] c"#  ∂T_blowup / ∂(everything)               #\00"
@.str.exp_ns_level8.25 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_level8.26 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.27 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_level8.28 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_level8.29 = private unnamed_addr constant [55 x i8] c"=== ∂T/∂ν: How viscosity affects blow-up time ===\00"
@.str.exp_ns_level8.30 = private unnamed_addr constant [42 x i8] c"  Sweep ν, track T_blowup and ∂T/∂ν\00"
@.str.exp_ns_level8.31 = private unnamed_addr constant [49 x i8] c"  Where ∂T/∂ν diverges = critical viscosity\00"
@.str.exp_ns_level8.32 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.33 = private unnamed_addr constant [60 x i8] c"  ν          T_blowup     ∂T/∂ν        Interpretation\00"
@.str.exp_ns_level8.34 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_level8.35 = private unnamed_addr constant [6 x i8] c"0.021\00"
@.str.exp_ns_level8.36 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.37 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.38 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.40 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.41 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.42 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.43 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.44 = private unnamed_addr constant [7 x i8] c"0.0005\00"
@.str.exp_ns_level8.45 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.46 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.47 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.48 = private unnamed_addr constant [22 x i8] c"  NO BLOW-UP (smooth)\00"
@.str.exp_ns_level8.49 = private unnamed_addr constant [9 x i8] c"100000.0\00"
@.str.exp_ns_level8.50 = private unnamed_addr constant [42 x i8] c"  ** CRITICAL — ∂T/∂ν diverging **\00"
@.str.exp_ns_level8.51 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.52 = private unnamed_addr constant [6 x i8] c"0.002\00"
@.str.exp_ns_level8.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.54 = private unnamed_addr constant [57 x i8] c"=== ∂T/∂A: How initial amplitude affects blow-up ===\00"
@.str.exp_ns_level8.55 = private unnamed_addr constant [49 x i8] c"  Where ∂T/∂A diverges = regularity boundary\00"
@.str.exp_ns_level8.56 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.57 = private unnamed_addr constant [58 x i8] c"  Amplitude  T_blowup     ∂T/∂A        Interpretation\00"
@.str.exp_ns_level8.58 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.59 = private unnamed_addr constant [5 x i8] c"2.21\00"
@.str.exp_ns_level8.60 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.61 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.62 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.64 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.65 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.66 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.68 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_level8.69 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.70 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.71 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.72 = private unnamed_addr constant [13 x i8] c"  NO BLOW-UP\00"
@.str.exp_ns_level8.73 = private unnamed_addr constant [8 x i8] c"50000.0\00"
@.str.exp_ns_level8.74 = private unnamed_addr constant [28 x i8] c"  ** REGULARITY BOUNDARY **\00"
@.str.exp_ns_level8.75 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.76 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.77 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.78 = private unnamed_addr constant [59 x i8] c"=== ∂T/∂dx: Does finer resolution prevent blow-up? ===\00"
@.str.exp_ns_level8.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.80 = private unnamed_addr constant [58 x i8] c"  dx         T_blowup     ∂T/∂dx       Interpretation\00"
@.str.exp_ns_level8.81 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_level8.82 = private unnamed_addr constant [5 x i8] c"0.51\00"
@.str.exp_ns_level8.83 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.84 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.85 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.87 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.88 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.89 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.91 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_level8.92 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.93 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.94 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.95 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.96 = private unnamed_addr constant [37 x i8] c"  finer = sooner blow-up (numerical)\00"
@.str.exp_ns_level8.97 = private unnamed_addr constant [35 x i8] c"  finer = later blow-up (physical)\00"
@.str.exp_ns_level8.98 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_level8.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.100 = private unnamed_addr constant [65 x i8] c"=== ∂T/∂boundary: How boundary damping affects stability ===\00"
@.str.exp_ns_level8.101 = private unnamed_addr constant [48 x i8] c"  boundary_damp=1.0: periodic. <1.0: absorbing.\00"
@.str.exp_ns_level8.102 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.103 = private unnamed_addr constant [58 x i8] c"  Damping    T_blowup     ∂T/∂damp     Interpretation\00"
@.str.exp_ns_level8.104 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_level8.105 = private unnamed_addr constant [5 x i8] c"1.01\00"
@.str.exp_ns_level8.106 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.107 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.108 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.109 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.110 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.111 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.112 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.113 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.114 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_level8.115 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.116 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.117 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.118 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.119 = private unnamed_addr constant [31 x i8] c"  more damping = later blow-up\00"
@.str.exp_ns_level8.120 = private unnamed_addr constant [34 x i8] c"  more damping = sooner (unusual)\00"
@.str.exp_ns_level8.121 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_level8.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.123 = private unnamed_addr constant [51 x i8] c"=== ∂T/∂ε: How much chaos is informative? ===\00"
@.str.exp_ns_level8.124 = private unnamed_addr constant [58 x i8] c"  The 'skeptical agent' injects ε and measures response.\00"
@.str.exp_ns_level8.125 = private unnamed_addr constant [59 x i8] c"  ∂T/∂ε tells us: does more chaos accelerate blow-up?\00"
@.str.exp_ns_level8.126 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.127 = private unnamed_addr constant [53 x i8] c"  Chaos ε    T_blowup     ∂T/∂ε        Meaning\00"
@.str.exp_ns_level8.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.129 = private unnamed_addr constant [5 x i8] c"0.51\00"
@.str.exp_ns_level8.130 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.131 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.132 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.133 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.134 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.135 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_level8.136 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.137 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.138 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_level8.139 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_level8.140 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_level8.141 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.142 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.143 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_level8.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.145 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_level8.146 = private unnamed_addr constant [37 x i8] c"  chaos ACCELERATES blow-up strongly\00"
@.str.exp_ns_level8.147 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_level8.148 = private unnamed_addr constant [35 x i8] c"  chaos accelerates blow-up mildly\00"
@.str.exp_ns_level8.149 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_level8.150 = private unnamed_addr constant [43 x i8] c"  chaos DELAYS blow-up (counterintuitive!)\00"
@.str.exp_ns_level8.151 = private unnamed_addr constant [27 x i8] c"  chaos has minimal effect\00"
@.str.exp_ns_level8.152 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_level8.153 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_level8.154 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_ns_level8.155 = private unnamed_addr constant [45 x i8] c"#  LEVEL 8 COMPLETE                        #\00"
@.str.exp_ns_level8.156 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_level8.157 = private unnamed_addr constant [45 x i8] c"#  Every parameter is a dual number:       #\00"
@.str.exp_ns_level8.158 = private unnamed_addr constant [49 x i8] c"#  ν, A, dx, boundary, ε — all learnable   #\00"
@.str.exp_ns_level8.159 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_level8.160 = private unnamed_addr constant [45 x i8] c"#  The meta-gradients reveal:              #\00"
@.str.exp_ns_level8.161 = private unnamed_addr constant [51 x i8] c"#  - Critical ν where ∂T/∂ν diverges       #\00"
@.str.exp_ns_level8.162 = private unnamed_addr constant [51 x i8] c"#  - Regularity boundary where ∂T/∂A diverges#\00"
@.str.exp_ns_level8.163 = private unnamed_addr constant [49 x i8] c"#  - Whether resolution helps (∂T/∂dx < 0) #\00"
@.str.exp_ns_level8.164 = private unnamed_addr constant [45 x i8] c"#  - How boundaries affect stability       #\00"
@.str.exp_ns_level8.165 = private unnamed_addr constant [46 x i8] c"#  - Optimal chaos for maximum information  #\00"
@.str.exp_ns_level8.166 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_ns_level8.167 = private unnamed_addr constant [45 x i8] c"#  The NS millennium question becomes:     #\00"
@.str.exp_ns_level8.168 = private unnamed_addr constant [52 x i8] c"#  does ∂T_blowup/∂(smoothness) → ∞?      #\00"
@.str.exp_ns_level8.169 = private unnamed_addr constant [47 x i8] c"#  If yes: smooth enough → no blow-up ever #\00"
@.str.exp_ns_level8.170 = private unnamed_addr constant [45 x i8] c"#  Computable via dual numbers.            #\00"
@.str.exp_ns_level8.171 = private unnamed_addr constant [45 x i8] c"############################################\00"
