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
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"step6"(i64 %u0, i64 %u1, i64 %u2, i64 %w0, i64 %w1, i64 %w2, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.32 = alloca i64
  %local.du0.33 = alloca i64
  %local.du1.34 = alloca i64
  %local.du2.35 = alloca i64
  %local.dw0.36 = alloca i64
  %local.dw1.37 = alloca i64
  %local.dw2.38 = alloca i64
  %local.su0.39 = alloca i64
  %local.su1.40 = alloca i64
  %local.su2.41 = alloca i64
  %local.vw0.42 = alloca i64
  %local.vw1.43 = alloca i64
  %local.vw2.44 = alloca i64
  %local.qw0.45 = alloca i64
  %local.qw1.46 = alloca i64
  %local.qw2.47 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t48 = load i64, ptr %local.w0
  %t49 = load i64, ptr %local.w0
  %t50 = call i64 @"sx_f64_mul"(i64 %t48, i64 %t49)
  %t51 = load i64, ptr %local.w1
  %t52 = load i64, ptr %local.w1
  %t53 = call i64 @"sx_f64_mul"(i64 %t51, i64 %t52)
  %t54 = call i64 @"sx_f64_add"(i64 %t50, i64 %t53)
  %t55 = load i64, ptr %local.w2
  %t56 = load i64, ptr %local.w2
  %t57 = call i64 @"sx_f64_mul"(i64 %t55, i64 %t56)
  %t58 = call i64 @"sx_f64_add"(i64 %t54, i64 %t57)
  store i64 %t58, ptr %local.omega_sq.32
  %t59 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.5)
  %t60 = load i64, ptr %local.nu
  %t61 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.6)
  %t62 = call i64 @"sx_f64_mul"(i64 %t60, i64 %t61)
  %t63 = load i64, ptr %local.u0
  %t64 = call i64 @"sx_f64_mul"(i64 %t62, i64 %t63)
  %t65 = call i64 @"sx_f64_sub"(i64 %t59, i64 %t64)
  store i64 %t65, ptr %local.du0.33
  %t66 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.7)
  %t67 = load i64, ptr %local.nu
  %t68 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.8)
  %t69 = call i64 @"sx_f64_mul"(i64 %t67, i64 %t68)
  %t70 = load i64, ptr %local.u1
  %t71 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t70)
  %t72 = call i64 @"sx_f64_sub"(i64 %t66, i64 %t71)
  store i64 %t72, ptr %local.du1.34
  %t73 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.9)
  %t74 = load i64, ptr %local.nu
  %t75 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.10)
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = load i64, ptr %local.u2
  %t78 = call i64 @"sx_f64_mul"(i64 %t76, i64 %t77)
  %t79 = call i64 @"sx_f64_sub"(i64 %t73, i64 %t78)
  store i64 %t79, ptr %local.du2.35
  %t80 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.11)
  %t81 = load i64, ptr %local.nu
  %t82 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.12)
  %t83 = call i64 @"sx_f64_mul"(i64 %t81, i64 %t82)
  %t84 = load i64, ptr %local.w0
  %t85 = call i64 @"sx_f64_mul"(i64 %t83, i64 %t84)
  %t86 = call i64 @"sx_f64_sub"(i64 %t80, i64 %t85)
  store i64 %t86, ptr %local.dw0.36
  %t87 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.13)
  %t88 = load i64, ptr %local.nu
  %t89 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.14)
  %t90 = call i64 @"sx_f64_mul"(i64 %t88, i64 %t89)
  %t91 = load i64, ptr %local.w1
  %t92 = call i64 @"sx_f64_mul"(i64 %t90, i64 %t91)
  %t93 = call i64 @"sx_f64_sub"(i64 %t87, i64 %t92)
  store i64 %t93, ptr %local.dw1.37
  %t94 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.15)
  %t95 = load i64, ptr %local.nu
  %t96 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.16)
  %t97 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t96)
  %t98 = load i64, ptr %local.w2
  %t99 = call i64 @"sx_f64_mul"(i64 %t97, i64 %t98)
  %t100 = call i64 @"sx_f64_sub"(i64 %t94, i64 %t99)
  store i64 %t100, ptr %local.dw2.38
  %t101 = load i64, ptr %local.sigma
  %t102 = load i64, ptr %local.w1
  %t103 = load i64, ptr %local.u2
  %t104 = call i64 @"sx_f64_mul"(i64 %t102, i64 %t103)
  %t105 = load i64, ptr %local.w2
  %t106 = load i64, ptr %local.u1
  %t107 = call i64 @"sx_f64_mul"(i64 %t105, i64 %t106)
  %t108 = call i64 @"sx_f64_sub"(i64 %t104, i64 %t107)
  %t109 = call i64 @"sx_f64_mul"(i64 %t101, i64 %t108)
  store i64 %t109, ptr %local.su0.39
  %t110 = load i64, ptr %local.sigma
  %t111 = load i64, ptr %local.w2
  %t112 = load i64, ptr %local.u0
  %t113 = call i64 @"sx_f64_mul"(i64 %t111, i64 %t112)
  %t114 = load i64, ptr %local.w0
  %t115 = load i64, ptr %local.u2
  %t116 = call i64 @"sx_f64_mul"(i64 %t114, i64 %t115)
  %t117 = call i64 @"sx_f64_sub"(i64 %t113, i64 %t116)
  %t118 = call i64 @"sx_f64_mul"(i64 %t110, i64 %t117)
  store i64 %t118, ptr %local.su1.40
  %t119 = load i64, ptr %local.sigma
  %t120 = load i64, ptr %local.w0
  %t121 = load i64, ptr %local.u1
  %t122 = call i64 @"sx_f64_mul"(i64 %t120, i64 %t121)
  %t123 = load i64, ptr %local.w1
  %t124 = load i64, ptr %local.u0
  %t125 = call i64 @"sx_f64_mul"(i64 %t123, i64 %t124)
  %t126 = call i64 @"sx_f64_sub"(i64 %t122, i64 %t125)
  %t127 = call i64 @"sx_f64_mul"(i64 %t119, i64 %t126)
  store i64 %t127, ptr %local.su2.41
  %t128 = load i64, ptr %local.lambda
  %t129 = load i64, ptr %local.w1
  %t130 = load i64, ptr %local.u2
  %t131 = call i64 @"sx_f64_mul"(i64 %t129, i64 %t130)
  %t132 = load i64, ptr %local.w2
  %t133 = load i64, ptr %local.u1
  %t134 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t133)
  %t135 = call i64 @"sx_f64_add"(i64 %t131, i64 %t134)
  %t136 = call i64 @"sx_f64_mul"(i64 %t128, i64 %t135)
  store i64 %t136, ptr %local.vw0.42
  %t137 = load i64, ptr %local.lambda
  %t138 = load i64, ptr %local.w2
  %t139 = load i64, ptr %local.u0
  %t140 = call i64 @"sx_f64_mul"(i64 %t138, i64 %t139)
  %t141 = load i64, ptr %local.w0
  %t142 = load i64, ptr %local.u2
  %t143 = call i64 @"sx_f64_mul"(i64 %t141, i64 %t142)
  %t144 = call i64 @"sx_f64_add"(i64 %t140, i64 %t143)
  %t145 = call i64 @"sx_f64_mul"(i64 %t137, i64 %t144)
  store i64 %t145, ptr %local.vw1.43
  %t146 = load i64, ptr %local.lambda
  %t147 = load i64, ptr %local.w0
  %t148 = load i64, ptr %local.u1
  %t149 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t148)
  %t150 = load i64, ptr %local.w1
  %t151 = load i64, ptr %local.u0
  %t152 = call i64 @"sx_f64_mul"(i64 %t150, i64 %t151)
  %t153 = call i64 @"sx_f64_add"(i64 %t149, i64 %t152)
  %t154 = call i64 @"sx_f64_mul"(i64 %t146, i64 %t153)
  store i64 %t154, ptr %local.vw2.44
  %t155 = load i64, ptr %local.lambda2
  %t156 = load i64, ptr %local.omega_sq.32
  %t157 = call i64 @"sx_f64_mul"(i64 %t155, i64 %t156)
  %t158 = load i64, ptr %local.w0
  %t159 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t158)
  store i64 %t159, ptr %local.qw0.45
  %t160 = load i64, ptr %local.lambda2
  %t161 = load i64, ptr %local.omega_sq.32
  %t162 = call i64 @"sx_f64_mul"(i64 %t160, i64 %t161)
  %t163 = load i64, ptr %local.w1
  %t164 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t163)
  store i64 %t164, ptr %local.qw1.46
  %t165 = load i64, ptr %local.lambda2
  %t166 = load i64, ptr %local.omega_sq.32
  %t167 = call i64 @"sx_f64_mul"(i64 %t165, i64 %t166)
  %t168 = load i64, ptr %local.w2
  %t169 = call i64 @"sx_f64_mul"(i64 %t167, i64 %t168)
  store i64 %t169, ptr %local.qw2.47
  %t170 = load i64, ptr %local.which
  %t171 = icmp eq i64 %t170, 0
  %t172 = zext i1 %t171 to i64
  %t173 = icmp ne i64 %t172, 0
  br i1 %t173, label %then3, label %else3
then3:
  %t174 = load i64, ptr %local.u0
  %t175 = load i64, ptr %local.dt
  %t176 = load i64, ptr %local.du0.33
  %t177 = load i64, ptr %local.su0.39
  %t178 = call i64 @"sx_f64_add"(i64 %t176, i64 %t177)
  %t179 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t178)
  %t180 = call i64 @"sx_f64_add"(i64 %t174, i64 %t179)
  ret i64 %t180
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t181 = phi i64 [ 0, %else3_end ]
  %t182 = load i64, ptr %local.which
  %t183 = icmp eq i64 %t182, 1
  %t184 = zext i1 %t183 to i64
  %t185 = icmp ne i64 %t184, 0
  br i1 %t185, label %then4, label %else4
then4:
  %t186 = load i64, ptr %local.u1
  %t187 = load i64, ptr %local.dt
  %t188 = load i64, ptr %local.du1.34
  %t189 = load i64, ptr %local.su1.40
  %t190 = call i64 @"sx_f64_add"(i64 %t188, i64 %t189)
  %t191 = call i64 @"sx_f64_mul"(i64 %t187, i64 %t190)
  %t192 = call i64 @"sx_f64_add"(i64 %t186, i64 %t191)
  ret i64 %t192
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t193 = phi i64 [ 0, %else4_end ]
  %t194 = load i64, ptr %local.which
  %t195 = icmp eq i64 %t194, 2
  %t196 = zext i1 %t195 to i64
  %t197 = icmp ne i64 %t196, 0
  br i1 %t197, label %then5, label %else5
then5:
  %t198 = load i64, ptr %local.u2
  %t199 = load i64, ptr %local.dt
  %t200 = load i64, ptr %local.du2.35
  %t201 = load i64, ptr %local.su2.41
  %t202 = call i64 @"sx_f64_add"(i64 %t200, i64 %t201)
  %t203 = call i64 @"sx_f64_mul"(i64 %t199, i64 %t202)
  %t204 = call i64 @"sx_f64_add"(i64 %t198, i64 %t203)
  ret i64 %t204
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t205 = phi i64 [ 0, %else5_end ]
  %t206 = load i64, ptr %local.which
  %t207 = icmp eq i64 %t206, 3
  %t208 = zext i1 %t207 to i64
  %t209 = icmp ne i64 %t208, 0
  br i1 %t209, label %then6, label %else6
then6:
  %t210 = load i64, ptr %local.w0
  %t211 = load i64, ptr %local.dt
  %t212 = load i64, ptr %local.dw0.36
  %t213 = load i64, ptr %local.vw0.42
  %t214 = call i64 @"sx_f64_add"(i64 %t212, i64 %t213)
  %t215 = load i64, ptr %local.qw0.45
  %t216 = call i64 @"sx_f64_add"(i64 %t214, i64 %t215)
  %t217 = call i64 @"sx_f64_mul"(i64 %t211, i64 %t216)
  %t218 = call i64 @"sx_f64_add"(i64 %t210, i64 %t217)
  ret i64 %t218
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t219 = phi i64 [ 0, %else6_end ]
  %t220 = load i64, ptr %local.which
  %t221 = icmp eq i64 %t220, 4
  %t222 = zext i1 %t221 to i64
  %t223 = icmp ne i64 %t222, 0
  br i1 %t223, label %then7, label %else7
then7:
  %t224 = load i64, ptr %local.w1
  %t225 = load i64, ptr %local.dt
  %t226 = load i64, ptr %local.dw1.37
  %t227 = load i64, ptr %local.vw1.43
  %t228 = call i64 @"sx_f64_add"(i64 %t226, i64 %t227)
  %t229 = load i64, ptr %local.qw1.46
  %t230 = call i64 @"sx_f64_add"(i64 %t228, i64 %t229)
  %t231 = call i64 @"sx_f64_mul"(i64 %t225, i64 %t230)
  %t232 = call i64 @"sx_f64_add"(i64 %t224, i64 %t231)
  ret i64 %t232
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t233 = phi i64 [ 0, %else7_end ]
  %t234 = load i64, ptr %local.w2
  %t235 = load i64, ptr %local.dt
  %t236 = load i64, ptr %local.dw2.38
  %t237 = load i64, ptr %local.vw2.44
  %t238 = call i64 @"sx_f64_add"(i64 %t236, i64 %t237)
  %t239 = load i64, ptr %local.qw2.47
  %t240 = call i64 @"sx_f64_add"(i64 %t238, i64 %t239)
  %t241 = call i64 @"sx_f64_mul"(i64 %t235, i64 %t240)
  %t242 = call i64 @"sx_f64_add"(i64 %t234, i64 %t241)
  ret i64 %t242
}

define i64 @"run6"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.pi.243 = alloca i64
  %local.u0.244 = alloca i64
  %local.u1.245 = alloca i64
  %local.u2.246 = alloca i64
  %local.w0.247 = alloca i64
  %local.w1.248 = alloca i64
  %local.w2.249 = alloca i64
  %local.s.250 = alloca i64
  %local.e.251 = alloca i64
  %local.n0.252 = alloca i64
  %local.n1.253 = alloca i64
  %local.n2.254 = alloca i64
  %local.n3.255 = alloca i64
  %local.n4.256 = alloca i64
  %local.n5.257 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t258 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.17)
  store i64 %t258, ptr %local.pi.243
  %t259 = load i64, ptr %local.amp
  %t260 = load i64, ptr %local.pi.243
  %t261 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.18)
  %t262 = call i64 @"sx_f64_mul"(i64 %t260, i64 %t261)
  %t263 = call i64 @"sin_f64"(i64 %t262)
  %t264 = call i64 @"sx_f64_mul"(i64 %t259, i64 %t263)
  store i64 %t264, ptr %local.u0.244
  %t265 = load i64, ptr %local.amp
  %t266 = load i64, ptr %local.pi.243
  %t267 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.19)
  %t268 = call i64 @"sx_f64_mul"(i64 %t266, i64 %t267)
  %t269 = call i64 @"sin_f64"(i64 %t268)
  %t270 = call i64 @"sx_f64_mul"(i64 %t265, i64 %t269)
  store i64 %t270, ptr %local.u1.245
  %t271 = load i64, ptr %local.amp
  %t272 = load i64, ptr %local.pi.243
  %t273 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.20)
  %t274 = call i64 @"sx_f64_mul"(i64 %t272, i64 %t273)
  %t275 = call i64 @"sin_f64"(i64 %t274)
  %t276 = call i64 @"sx_f64_mul"(i64 %t271, i64 %t275)
  store i64 %t276, ptr %local.u2.246
  %t277 = load i64, ptr %local.amp
  %t278 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.21)
  %t279 = call i64 @"sx_f64_mul"(i64 %t277, i64 %t278)
  %t280 = load i64, ptr %local.pi.243
  %t281 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.22)
  %t282 = call i64 @"sx_f64_mul"(i64 %t280, i64 %t281)
  %t283 = call i64 @"sin_f64"(i64 %t282)
  %t284 = call i64 @"sx_f64_mul"(i64 %t279, i64 %t283)
  store i64 %t284, ptr %local.w0.247
  %t285 = load i64, ptr %local.amp
  %t286 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.23)
  %t287 = call i64 @"sx_f64_mul"(i64 %t285, i64 %t286)
  %t288 = load i64, ptr %local.pi.243
  %t289 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.24)
  %t290 = call i64 @"sx_f64_mul"(i64 %t288, i64 %t289)
  %t291 = call i64 @"sin_f64"(i64 %t290)
  %t292 = call i64 @"sx_f64_mul"(i64 %t287, i64 %t291)
  store i64 %t292, ptr %local.w1.248
  %t293 = load i64, ptr %local.amp
  %t294 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.25)
  %t295 = call i64 @"sx_f64_mul"(i64 %t293, i64 %t294)
  %t296 = load i64, ptr %local.pi.243
  %t297 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.26)
  %t298 = call i64 @"sx_f64_mul"(i64 %t296, i64 %t297)
  %t299 = call i64 @"sin_f64"(i64 %t298)
  %t300 = call i64 @"sx_f64_mul"(i64 %t295, i64 %t299)
  store i64 %t300, ptr %local.w2.249
  store i64 0, ptr %local.s.250
  br label %loop8
loop8:
  %t301 = load i64, ptr %local.s.250
  %t302 = load i64, ptr %local.max_steps
  %t303 = icmp slt i64 %t301, %t302
  %t304 = zext i1 %t303 to i64
  %t305 = icmp ne i64 %t304, 0
  br i1 %t305, label %body8, label %endloop8
body8:
  %t306 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.27)
  %t307 = load i64, ptr %local.w0.247
  %t308 = load i64, ptr %local.w0.247
  %t309 = call i64 @"sx_f64_mul"(i64 %t307, i64 %t308)
  %t310 = load i64, ptr %local.w1.248
  %t311 = load i64, ptr %local.w1.248
  %t312 = call i64 @"sx_f64_mul"(i64 %t310, i64 %t311)
  %t313 = call i64 @"sx_f64_add"(i64 %t309, i64 %t312)
  %t314 = load i64, ptr %local.w2.249
  %t315 = load i64, ptr %local.w2.249
  %t316 = call i64 @"sx_f64_mul"(i64 %t314, i64 %t315)
  %t317 = call i64 @"sx_f64_add"(i64 %t313, i64 %t316)
  %t318 = call i64 @"sx_f64_mul"(i64 %t306, i64 %t317)
  store i64 %t318, ptr %local.e.251
  %t319 = load i64, ptr %local.e.251
  %t320 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.28)
  %t321 = call i64 @"sx_f64_gt"(i64 %t319, i64 %t320)
  %t322 = icmp ne i64 %t321, 0
  br i1 %t322, label %then9, label %else9
then9:
  %t323 = load i64, ptr %local.s.250
  %t324 = call i64 @"sx_int_to_f64"(i64 %t323)
  ret i64 %t324
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t325 = phi i64 [ 0, %else9_end ]
  %t326 = load i64, ptr %local.u0.244
  %t327 = load i64, ptr %local.u1.245
  %t328 = load i64, ptr %local.u2.246
  %t329 = load i64, ptr %local.w0.247
  %t330 = load i64, ptr %local.w1.248
  %t331 = load i64, ptr %local.w2.249
  %t332 = load i64, ptr %local.nu
  %t333 = load i64, ptr %local.sigma
  %t334 = load i64, ptr %local.lambda
  %t335 = load i64, ptr %local.lambda2
  %t336 = load i64, ptr %local.dt
  %t337 = call i64 @"step6"(i64 %t326, i64 %t327, i64 %t328, i64 %t329, i64 %t330, i64 %t331, i64 %t332, i64 %t333, i64 %t334, i64 %t335, i64 %t336, i64 0)
  store i64 %t337, ptr %local.n0.252
  %t338 = load i64, ptr %local.u0.244
  %t339 = load i64, ptr %local.u1.245
  %t340 = load i64, ptr %local.u2.246
  %t341 = load i64, ptr %local.w0.247
  %t342 = load i64, ptr %local.w1.248
  %t343 = load i64, ptr %local.w2.249
  %t344 = load i64, ptr %local.nu
  %t345 = load i64, ptr %local.sigma
  %t346 = load i64, ptr %local.lambda
  %t347 = load i64, ptr %local.lambda2
  %t348 = load i64, ptr %local.dt
  %t349 = call i64 @"step6"(i64 %t338, i64 %t339, i64 %t340, i64 %t341, i64 %t342, i64 %t343, i64 %t344, i64 %t345, i64 %t346, i64 %t347, i64 %t348, i64 1)
  store i64 %t349, ptr %local.n1.253
  %t350 = load i64, ptr %local.u0.244
  %t351 = load i64, ptr %local.u1.245
  %t352 = load i64, ptr %local.u2.246
  %t353 = load i64, ptr %local.w0.247
  %t354 = load i64, ptr %local.w1.248
  %t355 = load i64, ptr %local.w2.249
  %t356 = load i64, ptr %local.nu
  %t357 = load i64, ptr %local.sigma
  %t358 = load i64, ptr %local.lambda
  %t359 = load i64, ptr %local.lambda2
  %t360 = load i64, ptr %local.dt
  %t361 = call i64 @"step6"(i64 %t350, i64 %t351, i64 %t352, i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 %t357, i64 %t358, i64 %t359, i64 %t360, i64 2)
  store i64 %t361, ptr %local.n2.254
  %t362 = load i64, ptr %local.u0.244
  %t363 = load i64, ptr %local.u1.245
  %t364 = load i64, ptr %local.u2.246
  %t365 = load i64, ptr %local.w0.247
  %t366 = load i64, ptr %local.w1.248
  %t367 = load i64, ptr %local.w2.249
  %t368 = load i64, ptr %local.nu
  %t369 = load i64, ptr %local.sigma
  %t370 = load i64, ptr %local.lambda
  %t371 = load i64, ptr %local.lambda2
  %t372 = load i64, ptr %local.dt
  %t373 = call i64 @"step6"(i64 %t362, i64 %t363, i64 %t364, i64 %t365, i64 %t366, i64 %t367, i64 %t368, i64 %t369, i64 %t370, i64 %t371, i64 %t372, i64 3)
  store i64 %t373, ptr %local.n3.255
  %t374 = load i64, ptr %local.u0.244
  %t375 = load i64, ptr %local.u1.245
  %t376 = load i64, ptr %local.u2.246
  %t377 = load i64, ptr %local.w0.247
  %t378 = load i64, ptr %local.w1.248
  %t379 = load i64, ptr %local.w2.249
  %t380 = load i64, ptr %local.nu
  %t381 = load i64, ptr %local.sigma
  %t382 = load i64, ptr %local.lambda
  %t383 = load i64, ptr %local.lambda2
  %t384 = load i64, ptr %local.dt
  %t385 = call i64 @"step6"(i64 %t374, i64 %t375, i64 %t376, i64 %t377, i64 %t378, i64 %t379, i64 %t380, i64 %t381, i64 %t382, i64 %t383, i64 %t384, i64 4)
  store i64 %t385, ptr %local.n4.256
  %t386 = load i64, ptr %local.u0.244
  %t387 = load i64, ptr %local.u1.245
  %t388 = load i64, ptr %local.u2.246
  %t389 = load i64, ptr %local.w0.247
  %t390 = load i64, ptr %local.w1.248
  %t391 = load i64, ptr %local.w2.249
  %t392 = load i64, ptr %local.nu
  %t393 = load i64, ptr %local.sigma
  %t394 = load i64, ptr %local.lambda
  %t395 = load i64, ptr %local.lambda2
  %t396 = load i64, ptr %local.dt
  %t397 = call i64 @"step6"(i64 %t386, i64 %t387, i64 %t388, i64 %t389, i64 %t390, i64 %t391, i64 %t392, i64 %t393, i64 %t394, i64 %t395, i64 %t396, i64 5)
  store i64 %t397, ptr %local.n5.257
  %t398 = load i64, ptr %local.n0.252
  store i64 %t398, ptr %local.u0.244
  %t399 = load i64, ptr %local.n1.253
  store i64 %t399, ptr %local.u1.245
  %t400 = load i64, ptr %local.n2.254
  store i64 %t400, ptr %local.u2.246
  %t401 = load i64, ptr %local.n3.255
  store i64 %t401, ptr %local.w0.247
  %t402 = load i64, ptr %local.n4.256
  store i64 %t402, ptr %local.w1.248
  %t403 = load i64, ptr %local.n5.257
  store i64 %t403, ptr %local.w2.249
  %t404 = load i64, ptr %local.s.250
  %t405 = add i64 %t404, 1
  store i64 %t405, ptr %local.s.250
  br label %loop8
endloop8:
  %t406 = load i64, ptr %local.max_steps
  %t407 = call i64 @"sx_int_to_f64"(i64 %t406)
  ret i64 %t407
}

define i64 @"mode_analysis_6"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps, i64 %mode, i64 %query) nounwind {
entry:
  %local.pi.408 = alloca i64
  %local.u0.409 = alloca i64
  %local.u1.410 = alloca i64
  %local.u2.411 = alloca i64
  %local.w0.412 = alloca i64
  %local.w1.413 = alloca i64
  %local.w2.414 = alloca i64
  %local.max_stretch.415 = alloca i64
  %local.max_diffuse.416 = alloca i64
  %local.max_growth.417 = alloca i64
  %local.sum_stretch.418 = alloca i64
  %local.sum_diffuse.419 = alloca i64
  %local.count.420 = alloca i64
  %local.s.421 = alloca i64
  %local.omega_sq.422 = alloca i64
  %local.str_0.423 = alloca i64
  %local.str_1.424 = alloca i64
  %local.str_2.425 = alloca i64
  %local.dif_0.426 = alloca i64
  %local.dif_1.427 = alloca i64
  %local.dif_2.428 = alloca i64
  %local.g0.429 = alloca i64
  %local.g1.430 = alloca i64
  %local.g2.431 = alloca i64
  %local.s0.432 = alloca i64
  %local.s1.433 = alloca i64
  %local.s2.434 = alloca i64
  %local.d0.435 = alloca i64
  %local.d1.436 = alloca i64
  %local.d2.437 = alloca i64
  %local.s_m.438 = alloca i64
  %local.d_m.439 = alloca i64
  %local.g_max_local.440 = alloca i64
  %local.gm.441 = alloca i64
  %local.n0.442 = alloca i64
  %local.n1.443 = alloca i64
  %local.n2.444 = alloca i64
  %local.n3.445 = alloca i64
  %local.n4.446 = alloca i64
  %local.n5.447 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %local.mode = alloca i64
  store i64 %mode, ptr %local.mode
  %local.query = alloca i64
  store i64 %query, ptr %local.query
  %t448 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.29)
  store i64 %t448, ptr %local.pi.408
  %t449 = load i64, ptr %local.amp
  %t450 = load i64, ptr %local.pi.408
  %t451 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.30)
  %t452 = call i64 @"sx_f64_mul"(i64 %t450, i64 %t451)
  %t453 = call i64 @"sin_f64"(i64 %t452)
  %t454 = call i64 @"sx_f64_mul"(i64 %t449, i64 %t453)
  store i64 %t454, ptr %local.u0.409
  %t455 = load i64, ptr %local.amp
  %t456 = load i64, ptr %local.pi.408
  %t457 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.31)
  %t458 = call i64 @"sx_f64_mul"(i64 %t456, i64 %t457)
  %t459 = call i64 @"sin_f64"(i64 %t458)
  %t460 = call i64 @"sx_f64_mul"(i64 %t455, i64 %t459)
  store i64 %t460, ptr %local.u1.410
  %t461 = load i64, ptr %local.amp
  %t462 = load i64, ptr %local.pi.408
  %t463 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.32)
  %t464 = call i64 @"sx_f64_mul"(i64 %t462, i64 %t463)
  %t465 = call i64 @"sin_f64"(i64 %t464)
  %t466 = call i64 @"sx_f64_mul"(i64 %t461, i64 %t465)
  store i64 %t466, ptr %local.u2.411
  %t467 = load i64, ptr %local.amp
  %t468 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.33)
  %t469 = call i64 @"sx_f64_mul"(i64 %t467, i64 %t468)
  %t470 = load i64, ptr %local.pi.408
  %t471 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.34)
  %t472 = call i64 @"sx_f64_mul"(i64 %t470, i64 %t471)
  %t473 = call i64 @"sin_f64"(i64 %t472)
  %t474 = call i64 @"sx_f64_mul"(i64 %t469, i64 %t473)
  store i64 %t474, ptr %local.w0.412
  %t475 = load i64, ptr %local.amp
  %t476 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.35)
  %t477 = call i64 @"sx_f64_mul"(i64 %t475, i64 %t476)
  %t478 = load i64, ptr %local.pi.408
  %t479 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.36)
  %t480 = call i64 @"sx_f64_mul"(i64 %t478, i64 %t479)
  %t481 = call i64 @"sin_f64"(i64 %t480)
  %t482 = call i64 @"sx_f64_mul"(i64 %t477, i64 %t481)
  store i64 %t482, ptr %local.w1.413
  %t483 = load i64, ptr %local.amp
  %t484 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.37)
  %t485 = call i64 @"sx_f64_mul"(i64 %t483, i64 %t484)
  %t486 = load i64, ptr %local.pi.408
  %t487 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.38)
  %t488 = call i64 @"sx_f64_mul"(i64 %t486, i64 %t487)
  %t489 = call i64 @"sin_f64"(i64 %t488)
  %t490 = call i64 @"sx_f64_mul"(i64 %t485, i64 %t489)
  store i64 %t490, ptr %local.w2.414
  %t491 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.39)
  store i64 %t491, ptr %local.max_stretch.415
  %t492 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.40)
  store i64 %t492, ptr %local.max_diffuse.416
  %t493 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.41)
  store i64 %t493, ptr %local.max_growth.417
  %t494 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.42)
  store i64 %t494, ptr %local.sum_stretch.418
  %t495 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.43)
  store i64 %t495, ptr %local.sum_diffuse.419
  %t496 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.44)
  store i64 %t496, ptr %local.count.420
  store i64 0, ptr %local.s.421
  br label %loop10
loop10:
  %t497 = load i64, ptr %local.s.421
  %t498 = load i64, ptr %local.max_steps
  %t499 = icmp slt i64 %t497, %t498
  %t500 = zext i1 %t499 to i64
  %t501 = icmp ne i64 %t500, 0
  br i1 %t501, label %body10, label %endloop10
body10:
  %t502 = load i64, ptr %local.w0.412
  %t503 = load i64, ptr %local.w0.412
  %t504 = call i64 @"sx_f64_mul"(i64 %t502, i64 %t503)
  %t505 = load i64, ptr %local.w1.413
  %t506 = load i64, ptr %local.w1.413
  %t507 = call i64 @"sx_f64_mul"(i64 %t505, i64 %t506)
  %t508 = call i64 @"sx_f64_add"(i64 %t504, i64 %t507)
  %t509 = load i64, ptr %local.w2.414
  %t510 = load i64, ptr %local.w2.414
  %t511 = call i64 @"sx_f64_mul"(i64 %t509, i64 %t510)
  %t512 = call i64 @"sx_f64_add"(i64 %t508, i64 %t511)
  store i64 %t512, ptr %local.omega_sq.422
  %t513 = load i64, ptr %local.omega_sq.422
  %t514 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.45)
  %t515 = call i64 @"sx_f64_gt"(i64 %t513, i64 %t514)
  %t516 = icmp ne i64 %t515, 0
  br i1 %t516, label %then11, label %else11
then11:
  br label %endloop10
afterbreak12:
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t517 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t518 = load i64, ptr %local.lambda
  %t519 = load i64, ptr %local.w1.413
  %t520 = load i64, ptr %local.u2.411
  %t521 = call i64 @"sx_f64_mul"(i64 %t519, i64 %t520)
  %t522 = load i64, ptr %local.w2.414
  %t523 = load i64, ptr %local.u1.410
  %t524 = call i64 @"sx_f64_mul"(i64 %t522, i64 %t523)
  %t525 = call i64 @"sx_f64_add"(i64 %t521, i64 %t524)
  %t526 = call i64 @"sx_f64_mul"(i64 %t518, i64 %t525)
  %t527 = load i64, ptr %local.lambda2
  %t528 = load i64, ptr %local.omega_sq.422
  %t529 = call i64 @"sx_f64_mul"(i64 %t527, i64 %t528)
  %t530 = load i64, ptr %local.w0.412
  %t531 = call i64 @"sx_f64_mul"(i64 %t529, i64 %t530)
  %t532 = call i64 @"sx_f64_add"(i64 %t526, i64 %t531)
  store i64 %t532, ptr %local.str_0.423
  %t533 = load i64, ptr %local.lambda
  %t534 = load i64, ptr %local.w2.414
  %t535 = load i64, ptr %local.u0.409
  %t536 = call i64 @"sx_f64_mul"(i64 %t534, i64 %t535)
  %t537 = load i64, ptr %local.w0.412
  %t538 = load i64, ptr %local.u2.411
  %t539 = call i64 @"sx_f64_mul"(i64 %t537, i64 %t538)
  %t540 = call i64 @"sx_f64_add"(i64 %t536, i64 %t539)
  %t541 = call i64 @"sx_f64_mul"(i64 %t533, i64 %t540)
  %t542 = load i64, ptr %local.lambda2
  %t543 = load i64, ptr %local.omega_sq.422
  %t544 = call i64 @"sx_f64_mul"(i64 %t542, i64 %t543)
  %t545 = load i64, ptr %local.w1.413
  %t546 = call i64 @"sx_f64_mul"(i64 %t544, i64 %t545)
  %t547 = call i64 @"sx_f64_add"(i64 %t541, i64 %t546)
  store i64 %t547, ptr %local.str_1.424
  %t548 = load i64, ptr %local.lambda
  %t549 = load i64, ptr %local.w0.412
  %t550 = load i64, ptr %local.u1.410
  %t551 = call i64 @"sx_f64_mul"(i64 %t549, i64 %t550)
  %t552 = load i64, ptr %local.w1.413
  %t553 = load i64, ptr %local.u0.409
  %t554 = call i64 @"sx_f64_mul"(i64 %t552, i64 %t553)
  %t555 = call i64 @"sx_f64_add"(i64 %t551, i64 %t554)
  %t556 = call i64 @"sx_f64_mul"(i64 %t548, i64 %t555)
  %t557 = load i64, ptr %local.lambda2
  %t558 = load i64, ptr %local.omega_sq.422
  %t559 = call i64 @"sx_f64_mul"(i64 %t557, i64 %t558)
  %t560 = load i64, ptr %local.w2.414
  %t561 = call i64 @"sx_f64_mul"(i64 %t559, i64 %t560)
  %t562 = call i64 @"sx_f64_add"(i64 %t556, i64 %t561)
  store i64 %t562, ptr %local.str_2.425
  %t563 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.46)
  %t564 = load i64, ptr %local.nu
  %t565 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.47)
  %t566 = call i64 @"sx_f64_mul"(i64 %t564, i64 %t565)
  %t567 = load i64, ptr %local.w0.412
  %t568 = call i64 @"sx_f64_mul"(i64 %t566, i64 %t567)
  %t569 = call i64 @"sx_f64_sub"(i64 %t563, i64 %t568)
  store i64 %t569, ptr %local.dif_0.426
  %t570 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.48)
  %t571 = load i64, ptr %local.nu
  %t572 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.49)
  %t573 = call i64 @"sx_f64_mul"(i64 %t571, i64 %t572)
  %t574 = load i64, ptr %local.w1.413
  %t575 = call i64 @"sx_f64_mul"(i64 %t573, i64 %t574)
  %t576 = call i64 @"sx_f64_sub"(i64 %t570, i64 %t575)
  store i64 %t576, ptr %local.dif_1.427
  %t577 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.50)
  %t578 = load i64, ptr %local.nu
  %t579 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.51)
  %t580 = call i64 @"sx_f64_mul"(i64 %t578, i64 %t579)
  %t581 = load i64, ptr %local.w2.414
  %t582 = call i64 @"sx_f64_mul"(i64 %t580, i64 %t581)
  %t583 = call i64 @"sx_f64_sub"(i64 %t577, i64 %t582)
  store i64 %t583, ptr %local.dif_2.428
  %t584 = load i64, ptr %local.w0.412
  %t585 = load i64, ptr %local.str_0.423
  %t586 = load i64, ptr %local.dif_0.426
  %t587 = call i64 @"sx_f64_add"(i64 %t585, i64 %t586)
  %t588 = call i64 @"sx_f64_mul"(i64 %t584, i64 %t587)
  store i64 %t588, ptr %local.g0.429
  %t589 = load i64, ptr %local.w1.413
  %t590 = load i64, ptr %local.str_1.424
  %t591 = load i64, ptr %local.dif_1.427
  %t592 = call i64 @"sx_f64_add"(i64 %t590, i64 %t591)
  %t593 = call i64 @"sx_f64_mul"(i64 %t589, i64 %t592)
  store i64 %t593, ptr %local.g1.430
  %t594 = load i64, ptr %local.w2.414
  %t595 = load i64, ptr %local.str_2.425
  %t596 = load i64, ptr %local.dif_2.428
  %t597 = call i64 @"sx_f64_add"(i64 %t595, i64 %t596)
  %t598 = call i64 @"sx_f64_mul"(i64 %t594, i64 %t597)
  store i64 %t598, ptr %local.g2.431
  %t599 = load i64, ptr %local.w0.412
  %t600 = load i64, ptr %local.str_0.423
  %t601 = call i64 @"sx_f64_mul"(i64 %t599, i64 %t600)
  store i64 %t601, ptr %local.s0.432
  %t602 = load i64, ptr %local.w1.413
  %t603 = load i64, ptr %local.str_1.424
  %t604 = call i64 @"sx_f64_mul"(i64 %t602, i64 %t603)
  store i64 %t604, ptr %local.s1.433
  %t605 = load i64, ptr %local.w2.414
  %t606 = load i64, ptr %local.str_2.425
  %t607 = call i64 @"sx_f64_mul"(i64 %t605, i64 %t606)
  store i64 %t607, ptr %local.s2.434
  %t608 = load i64, ptr %local.w0.412
  %t609 = load i64, ptr %local.dif_0.426
  %t610 = call i64 @"sx_f64_mul"(i64 %t608, i64 %t609)
  store i64 %t610, ptr %local.d0.435
  %t611 = load i64, ptr %local.w1.413
  %t612 = load i64, ptr %local.dif_1.427
  %t613 = call i64 @"sx_f64_mul"(i64 %t611, i64 %t612)
  store i64 %t613, ptr %local.d1.436
  %t614 = load i64, ptr %local.w2.414
  %t615 = load i64, ptr %local.dif_2.428
  %t616 = call i64 @"sx_f64_mul"(i64 %t614, i64 %t615)
  store i64 %t616, ptr %local.d2.437
  %t617 = load i64, ptr %local.s0.432
  store i64 %t617, ptr %local.s_m.438
  %t618 = load i64, ptr %local.d0.435
  store i64 %t618, ptr %local.d_m.439
  %t619 = load i64, ptr %local.mode
  %t620 = icmp eq i64 %t619, 1
  %t621 = zext i1 %t620 to i64
  %t622 = icmp ne i64 %t621, 0
  br i1 %t622, label %then13, label %else13
then13:
  %t623 = load i64, ptr %local.s1.433
  store i64 %t623, ptr %local.s_m.438
  %t624 = load i64, ptr %local.d1.436
  store i64 %t624, ptr %local.d_m.439
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t625 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t626 = load i64, ptr %local.mode
  %t627 = icmp eq i64 %t626, 2
  %t628 = zext i1 %t627 to i64
  %t629 = icmp ne i64 %t628, 0
  br i1 %t629, label %then14, label %else14
then14:
  %t630 = load i64, ptr %local.s2.434
  store i64 %t630, ptr %local.s_m.438
  %t631 = load i64, ptr %local.d2.437
  store i64 %t631, ptr %local.d_m.439
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t632 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t633 = load i64, ptr %local.sum_stretch.418
  %t634 = load i64, ptr %local.s_m.438
  %t635 = call i64 @"abs_f64"(i64 %t634)
  %t636 = call i64 @"sx_f64_add"(i64 %t633, i64 %t635)
  store i64 %t636, ptr %local.sum_stretch.418
  %t637 = load i64, ptr %local.sum_diffuse.419
  %t638 = load i64, ptr %local.d_m.439
  %t639 = call i64 @"abs_f64"(i64 %t638)
  %t640 = call i64 @"sx_f64_add"(i64 %t637, i64 %t639)
  store i64 %t640, ptr %local.sum_diffuse.419
  %t641 = load i64, ptr %local.count.420
  %t642 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.52)
  %t643 = call i64 @"sx_f64_add"(i64 %t641, i64 %t642)
  store i64 %t643, ptr %local.count.420
  %t644 = load i64, ptr %local.g0.429
  %t645 = call i64 @"abs_f64"(i64 %t644)
  store i64 %t645, ptr %local.g_max_local.440
  %t646 = load i64, ptr %local.g_max_local.440
  store i64 %t646, ptr %local.gm.441
  %t647 = load i64, ptr %local.g1.430
  %t648 = call i64 @"abs_f64"(i64 %t647)
  %t649 = load i64, ptr %local.gm.441
  %t650 = call i64 @"sx_f64_gt"(i64 %t648, i64 %t649)
  %t651 = icmp ne i64 %t650, 0
  br i1 %t651, label %then15, label %else15
then15:
  %t652 = load i64, ptr %local.g1.430
  %t653 = call i64 @"abs_f64"(i64 %t652)
  store i64 %t653, ptr %local.gm.441
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t654 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t655 = load i64, ptr %local.g2.431
  %t656 = call i64 @"abs_f64"(i64 %t655)
  %t657 = load i64, ptr %local.gm.441
  %t658 = call i64 @"sx_f64_gt"(i64 %t656, i64 %t657)
  %t659 = icmp ne i64 %t658, 0
  br i1 %t659, label %then16, label %else16
then16:
  %t660 = load i64, ptr %local.g2.431
  %t661 = call i64 @"abs_f64"(i64 %t660)
  store i64 %t661, ptr %local.gm.441
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t662 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t663 = load i64, ptr %local.gm.441
  %t664 = load i64, ptr %local.max_growth.417
  %t665 = call i64 @"sx_f64_gt"(i64 %t663, i64 %t664)
  %t666 = icmp ne i64 %t665, 0
  br i1 %t666, label %then17, label %else17
then17:
  %t667 = load i64, ptr %local.gm.441
  store i64 %t667, ptr %local.max_growth.417
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t668 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t669 = load i64, ptr %local.u0.409
  %t670 = load i64, ptr %local.u1.410
  %t671 = load i64, ptr %local.u2.411
  %t672 = load i64, ptr %local.w0.412
  %t673 = load i64, ptr %local.w1.413
  %t674 = load i64, ptr %local.w2.414
  %t675 = load i64, ptr %local.nu
  %t676 = load i64, ptr %local.sigma
  %t677 = load i64, ptr %local.lambda
  %t678 = load i64, ptr %local.lambda2
  %t679 = load i64, ptr %local.dt
  %t680 = call i64 @"step6"(i64 %t669, i64 %t670, i64 %t671, i64 %t672, i64 %t673, i64 %t674, i64 %t675, i64 %t676, i64 %t677, i64 %t678, i64 %t679, i64 0)
  store i64 %t680, ptr %local.n0.442
  %t681 = load i64, ptr %local.u0.409
  %t682 = load i64, ptr %local.u1.410
  %t683 = load i64, ptr %local.u2.411
  %t684 = load i64, ptr %local.w0.412
  %t685 = load i64, ptr %local.w1.413
  %t686 = load i64, ptr %local.w2.414
  %t687 = load i64, ptr %local.nu
  %t688 = load i64, ptr %local.sigma
  %t689 = load i64, ptr %local.lambda
  %t690 = load i64, ptr %local.lambda2
  %t691 = load i64, ptr %local.dt
  %t692 = call i64 @"step6"(i64 %t681, i64 %t682, i64 %t683, i64 %t684, i64 %t685, i64 %t686, i64 %t687, i64 %t688, i64 %t689, i64 %t690, i64 %t691, i64 1)
  store i64 %t692, ptr %local.n1.443
  %t693 = load i64, ptr %local.u0.409
  %t694 = load i64, ptr %local.u1.410
  %t695 = load i64, ptr %local.u2.411
  %t696 = load i64, ptr %local.w0.412
  %t697 = load i64, ptr %local.w1.413
  %t698 = load i64, ptr %local.w2.414
  %t699 = load i64, ptr %local.nu
  %t700 = load i64, ptr %local.sigma
  %t701 = load i64, ptr %local.lambda
  %t702 = load i64, ptr %local.lambda2
  %t703 = load i64, ptr %local.dt
  %t704 = call i64 @"step6"(i64 %t693, i64 %t694, i64 %t695, i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 %t700, i64 %t701, i64 %t702, i64 %t703, i64 2)
  store i64 %t704, ptr %local.n2.444
  %t705 = load i64, ptr %local.u0.409
  %t706 = load i64, ptr %local.u1.410
  %t707 = load i64, ptr %local.u2.411
  %t708 = load i64, ptr %local.w0.412
  %t709 = load i64, ptr %local.w1.413
  %t710 = load i64, ptr %local.w2.414
  %t711 = load i64, ptr %local.nu
  %t712 = load i64, ptr %local.sigma
  %t713 = load i64, ptr %local.lambda
  %t714 = load i64, ptr %local.lambda2
  %t715 = load i64, ptr %local.dt
  %t716 = call i64 @"step6"(i64 %t705, i64 %t706, i64 %t707, i64 %t708, i64 %t709, i64 %t710, i64 %t711, i64 %t712, i64 %t713, i64 %t714, i64 %t715, i64 3)
  store i64 %t716, ptr %local.n3.445
  %t717 = load i64, ptr %local.u0.409
  %t718 = load i64, ptr %local.u1.410
  %t719 = load i64, ptr %local.u2.411
  %t720 = load i64, ptr %local.w0.412
  %t721 = load i64, ptr %local.w1.413
  %t722 = load i64, ptr %local.w2.414
  %t723 = load i64, ptr %local.nu
  %t724 = load i64, ptr %local.sigma
  %t725 = load i64, ptr %local.lambda
  %t726 = load i64, ptr %local.lambda2
  %t727 = load i64, ptr %local.dt
  %t728 = call i64 @"step6"(i64 %t717, i64 %t718, i64 %t719, i64 %t720, i64 %t721, i64 %t722, i64 %t723, i64 %t724, i64 %t725, i64 %t726, i64 %t727, i64 4)
  store i64 %t728, ptr %local.n4.446
  %t729 = load i64, ptr %local.u0.409
  %t730 = load i64, ptr %local.u1.410
  %t731 = load i64, ptr %local.u2.411
  %t732 = load i64, ptr %local.w0.412
  %t733 = load i64, ptr %local.w1.413
  %t734 = load i64, ptr %local.w2.414
  %t735 = load i64, ptr %local.nu
  %t736 = load i64, ptr %local.sigma
  %t737 = load i64, ptr %local.lambda
  %t738 = load i64, ptr %local.lambda2
  %t739 = load i64, ptr %local.dt
  %t740 = call i64 @"step6"(i64 %t729, i64 %t730, i64 %t731, i64 %t732, i64 %t733, i64 %t734, i64 %t735, i64 %t736, i64 %t737, i64 %t738, i64 %t739, i64 5)
  store i64 %t740, ptr %local.n5.447
  %t741 = load i64, ptr %local.n0.442
  store i64 %t741, ptr %local.u0.409
  %t742 = load i64, ptr %local.n1.443
  store i64 %t742, ptr %local.u1.410
  %t743 = load i64, ptr %local.n2.444
  store i64 %t743, ptr %local.u2.411
  %t744 = load i64, ptr %local.n3.445
  store i64 %t744, ptr %local.w0.412
  %t745 = load i64, ptr %local.n4.446
  store i64 %t745, ptr %local.w1.413
  %t746 = load i64, ptr %local.n5.447
  store i64 %t746, ptr %local.w2.414
  %t747 = load i64, ptr %local.s.421
  %t748 = add i64 %t747, 1
  store i64 %t748, ptr %local.s.421
  br label %loop10
endloop10:
  %t749 = load i64, ptr %local.query
  %t750 = icmp eq i64 %t749, 0
  %t751 = zext i1 %t750 to i64
  %t752 = icmp ne i64 %t751, 0
  br i1 %t752, label %then18, label %else18
then18:
  %t753 = load i64, ptr %local.count.420
  %t754 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.53)
  %t755 = call i64 @"sx_f64_gt"(i64 %t753, i64 %t754)
  %t756 = icmp ne i64 %t755, 0
  br i1 %t756, label %then19, label %else19
then19:
  %t757 = load i64, ptr %local.sum_stretch.418
  %t758 = load i64, ptr %local.count.420
  %t759 = call i64 @"sx_f64_div"(i64 %t757, i64 %t758)
  ret i64 %t759
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t760 = phi i64 [ 0, %else19_end ]
  %t761 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.54)
  ret i64 %t761
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t762 = phi i64 [ 0, %else18_end ]
  %t763 = load i64, ptr %local.query
  %t764 = icmp eq i64 %t763, 1
  %t765 = zext i1 %t764 to i64
  %t766 = icmp ne i64 %t765, 0
  br i1 %t766, label %then20, label %else20
then20:
  %t767 = load i64, ptr %local.count.420
  %t768 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.55)
  %t769 = call i64 @"sx_f64_gt"(i64 %t767, i64 %t768)
  %t770 = icmp ne i64 %t769, 0
  br i1 %t770, label %then21, label %else21
then21:
  %t771 = load i64, ptr %local.sum_diffuse.419
  %t772 = load i64, ptr %local.count.420
  %t773 = call i64 @"sx_f64_div"(i64 %t771, i64 %t772)
  ret i64 %t773
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t774 = phi i64 [ 0, %else21_end ]
  %t775 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.56)
  ret i64 %t775
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t776 = phi i64 [ 0, %else20_end ]
  %t777 = load i64, ptr %local.max_growth.417
  ret i64 %t777
}

define i64 @"run_n"(i64 %amp, i64 %n_modes, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.n.778 = alloca i64
  %local.nu_e.779 = alloca i64
  %local.sigma_e.780 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t781 = load i64, ptr %local.n_modes
  %t782 = call i64 @"sx_int_to_f64"(i64 %t781)
  store i64 %t782, ptr %local.n.778
  %t783 = load i64, ptr %local.nu
  %t784 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.57)
  %t785 = load i64, ptr %local.n.778
  %t786 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.58)
  %t787 = call i64 @"sx_f64_sub"(i64 %t785, i64 %t786)
  %t788 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.59)
  %t789 = call i64 @"sx_f64_div"(i64 %t787, i64 %t788)
  %t790 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.60)
  %t791 = call i64 @"sx_f64_mul"(i64 %t789, i64 %t790)
  %t792 = call i64 @"sx_f64_add"(i64 %t784, i64 %t791)
  %t793 = call i64 @"sx_f64_mul"(i64 %t783, i64 %t792)
  store i64 %t793, ptr %local.nu_e.779
  %t794 = load i64, ptr %local.sigma
  %t795 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.61)
  %t796 = load i64, ptr %local.n.778
  %t797 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.62)
  %t798 = call i64 @"sx_f64_sub"(i64 %t796, i64 %t797)
  %t799 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.63)
  %t800 = call i64 @"sx_f64_div"(i64 %t798, i64 %t799)
  %t801 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.64)
  %t802 = call i64 @"sx_f64_mul"(i64 %t800, i64 %t801)
  %t803 = call i64 @"sx_f64_add"(i64 %t795, i64 %t802)
  %t804 = call i64 @"sx_f64_mul"(i64 %t794, i64 %t803)
  store i64 %t804, ptr %local.sigma_e.780
  %t805 = load i64, ptr %local.amp
  %t806 = load i64, ptr %local.nu_e.779
  %t807 = load i64, ptr %local.sigma_e.780
  %t808 = load i64, ptr %local.lambda
  %t809 = load i64, ptr %local.lambda2
  %t810 = load i64, ptr %local.dt
  %t811 = load i64, ptr %local.max_steps
  %t812 = call i64 @"run6"(i64 %t805, i64 %t806, i64 %t807, i64 %t808, i64 %t809, i64 %t810, i64 %t811)
  ret i64 %t812
}

define i64 @"find_a_star"(i64 %n_modes, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.lo.813 = alloca i64
  %local.hi.814 = alloca i64
  %local.iter.815 = alloca i64
  %local.mid.816 = alloca i64
  %local.r.817 = alloca i64
  %local.n_modes = alloca i64
  store i64 %n_modes, ptr %local.n_modes
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t818 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.65)
  store i64 %t818, ptr %local.lo.813
  %t819 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.66)
  store i64 %t819, ptr %local.hi.814
  store i64 0, ptr %local.iter.815
  br label %loop22
loop22:
  %t820 = load i64, ptr %local.iter.815
  %t821 = icmp slt i64 %t820, 18
  %t822 = zext i1 %t821 to i64
  %t823 = icmp ne i64 %t822, 0
  br i1 %t823, label %body22, label %endloop22
body22:
  %t824 = load i64, ptr %local.lo.813
  %t825 = load i64, ptr %local.hi.814
  %t826 = call i64 @"sx_f64_add"(i64 %t824, i64 %t825)
  %t827 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.67)
  %t828 = call i64 @"sx_f64_div"(i64 %t826, i64 %t827)
  store i64 %t828, ptr %local.mid.816
  %t829 = load i64, ptr %local.mid.816
  %t830 = load i64, ptr %local.n_modes
  %t831 = load i64, ptr %local.nu
  %t832 = load i64, ptr %local.sigma
  %t833 = load i64, ptr %local.lambda
  %t834 = load i64, ptr %local.lambda2
  %t835 = load i64, ptr %local.dt
  %t836 = load i64, ptr %local.max_steps
  %t837 = call i64 @"run_n"(i64 %t829, i64 %t830, i64 %t831, i64 %t832, i64 %t833, i64 %t834, i64 %t835, i64 %t836)
  store i64 %t837, ptr %local.r.817
  %t838 = load i64, ptr %local.r.817
  %t839 = load i64, ptr %local.max_steps
  %t840 = call i64 @"sx_int_to_f64"(i64 %t839)
  %t841 = call i64 @"sx_f64_lt"(i64 %t838, i64 %t840)
  %t842 = icmp ne i64 %t841, 0
  br i1 %t842, label %then23, label %else23
then23:
  %t843 = load i64, ptr %local.mid.816
  store i64 %t843, ptr %local.hi.814
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t844 = load i64, ptr %local.mid.816
  store i64 %t844, ptr %local.lo.813
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t845 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t846 = load i64, ptr %local.iter.815
  %t847 = add i64 %t846, 1
  store i64 %t847, ptr %local.iter.815
  br label %loop22
endloop22:
  %t848 = load i64, ptr %local.lo.813
  %t849 = load i64, ptr %local.hi.814
  %t850 = call i64 @"sx_f64_add"(i64 %t848, i64 %t849)
  %t851 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.68)
  %t852 = call i64 @"sx_f64_div"(i64 %t850, i64 %t851)
  ret i64 %t852
}

define i64 @"find_bottleneck"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.g0.853 = alloca i64
  %local.g1.854 = alloca i64
  %local.g2.855 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t856 = load i64, ptr %local.amp
  %t857 = load i64, ptr %local.nu
  %t858 = load i64, ptr %local.sigma
  %t859 = load i64, ptr %local.lambda
  %t860 = load i64, ptr %local.lambda2
  %t861 = load i64, ptr %local.dt
  %t862 = load i64, ptr %local.max_steps
  %t863 = call i64 @"mode_analysis_6"(i64 %t856, i64 %t857, i64 %t858, i64 %t859, i64 %t860, i64 %t861, i64 %t862, i64 0, i64 2)
  store i64 %t863, ptr %local.g0.853
  %t864 = load i64, ptr %local.amp
  %t865 = load i64, ptr %local.nu
  %t866 = load i64, ptr %local.sigma
  %t867 = load i64, ptr %local.lambda
  %t868 = load i64, ptr %local.lambda2
  %t869 = load i64, ptr %local.dt
  %t870 = load i64, ptr %local.max_steps
  %t871 = call i64 @"mode_analysis_6"(i64 %t864, i64 %t865, i64 %t866, i64 %t867, i64 %t868, i64 %t869, i64 %t870, i64 1, i64 2)
  store i64 %t871, ptr %local.g1.854
  %t872 = load i64, ptr %local.amp
  %t873 = load i64, ptr %local.nu
  %t874 = load i64, ptr %local.sigma
  %t875 = load i64, ptr %local.lambda
  %t876 = load i64, ptr %local.lambda2
  %t877 = load i64, ptr %local.dt
  %t878 = load i64, ptr %local.max_steps
  %t879 = call i64 @"mode_analysis_6"(i64 %t872, i64 %t873, i64 %t874, i64 %t875, i64 %t876, i64 %t877, i64 %t878, i64 2, i64 2)
  store i64 %t879, ptr %local.g2.855
  %t880 = load i64, ptr %local.g0.853
  %t881 = load i64, ptr %local.g1.854
  %t882 = call i64 @"sx_f64_ge"(i64 %t880, i64 %t881)
  %t883 = icmp ne i64 %t882, 0
  br i1 %t883, label %then24, label %else24
then24:
  %t884 = load i64, ptr %local.g0.853
  %t885 = load i64, ptr %local.g2.855
  %t886 = call i64 @"sx_f64_ge"(i64 %t884, i64 %t885)
  %t887 = icmp ne i64 %t886, 0
  br i1 %t887, label %then25, label %else25
then25:
  ret i64 0
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t888 = phi i64 [ 0, %else25_end ]
  ret i64 2
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t889 = phi i64 [ 0, %else24_end ]
  %t890 = load i64, ptr %local.g1.854
  %t891 = load i64, ptr %local.g2.855
  %t892 = call i64 @"sx_f64_ge"(i64 %t890, i64 %t891)
  %t893 = icmp ne i64 %t892, 0
  br i1 %t893, label %then26, label %else26
then26:
  ret i64 1
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t894 = phi i64 [ 0, %else26_end ]
  ret i64 2
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.895 = alloca i64
  %local.sigma.896 = alloca i64
  %local.lambda.897 = alloca i64
  %local.lambda2.898 = alloca i64
  %local.dt.899 = alloca i64
  %local.max_s.900 = alloca i64
  %local.a_star_prev.901 = alloca i64
  %local.monotone_from.902 = alloca i64
  %local.monotone_count.903 = alloca i64
  %local.violation_count.904 = alloca i64
  %local.first_violation.905 = alloca i64
  %local.a_star_last.906 = alloca i64
  %local.a_star_8.907 = alloca i64
  %local.sum_n.908 = alloca i64
  %local.sum_a.909 = alloca i64
  %local.sum_nn.910 = alloca i64
  %local.sum_na.911 = alloca i64
  %local.reg_count.912 = alloca i64
  %local.ni.913 = alloca i64
  %local.n_modes.914 = alloca i64
  %local.a_star.915 = alloca i64
  %local.n.916 = alloca i64
  %local.nu_e.917 = alloca i64
  %local.sigma_e.918 = alloca i64
  %local.bottleneck.919 = alloca i64
  %local.stretch.920 = alloca i64
  %local.diffuse.921 = alloca i64
  %local.a_change.922 = alloca i64
  %local.inv_n.923 = alloca i64
  %local.bk.924 = alloca i64
  %local.mean_n.925 = alloca i64
  %local.mean_a.926 = alloca i64
  %local.ss_nn.927 = alloca i64
  %local.ss_na.928 = alloca i64
  %local.c_conv.929 = alloca i64
  %local.a_inf.930 = alloca i64
  %local.n_modes.931 = alloca i64
  %local.a_star.932 = alloca i64
  %local.deviation.933 = alloca i64
  %local.predicted.934 = alloca i64
  %t935 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.69)
  %t936 = ptrtoint ptr %t935 to i64
  %t937 = inttoptr i64 %t936 to ptr
  call void @intrinsic_println(ptr %t937)
  %t938 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.70)
  %t939 = ptrtoint ptr %t938 to i64
  %t940 = inttoptr i64 %t939 to ptr
  call void @intrinsic_println(ptr %t940)
  %t941 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.71)
  %t942 = ptrtoint ptr %t941 to i64
  %t943 = inttoptr i64 %t942 to ptr
  call void @intrinsic_println(ptr %t943)
  %t944 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.72)
  %t945 = ptrtoint ptr %t944 to i64
  %t946 = inttoptr i64 %t945 to ptr
  call void @intrinsic_println(ptr %t946)
  %t947 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.73)
  %t948 = ptrtoint ptr %t947 to i64
  %t949 = inttoptr i64 %t948 to ptr
  call void @intrinsic_println(ptr %t949)
  %t950 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.74)
  %t951 = ptrtoint ptr %t950 to i64
  %t952 = inttoptr i64 %t951 to ptr
  call void @intrinsic_println(ptr %t952)
  %t953 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.75)
  %t954 = ptrtoint ptr %t953 to i64
  %t955 = inttoptr i64 %t954 to ptr
  call void @intrinsic_println(ptr %t955)
  %t956 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.76)
  %t957 = ptrtoint ptr %t956 to i64
  %t958 = inttoptr i64 %t957 to ptr
  call void @intrinsic_println(ptr %t958)
  %t959 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.77)
  %t960 = ptrtoint ptr %t959 to i64
  %t961 = inttoptr i64 %t960 to ptr
  call void @intrinsic_println(ptr %t961)
  %t962 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.78)
  %t963 = ptrtoint ptr %t962 to i64
  %t964 = inttoptr i64 %t963 to ptr
  call void @intrinsic_println(ptr %t964)
  %t965 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.79)
  %t966 = ptrtoint ptr %t965 to i64
  %t967 = inttoptr i64 %t966 to ptr
  call void @intrinsic_println(ptr %t967)
  %t968 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.80)
  store i64 %t968, ptr %local.nu.895
  %t969 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.81)
  store i64 %t969, ptr %local.sigma.896
  %t970 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.82)
  store i64 %t970, ptr %local.lambda.897
  %t971 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.83)
  store i64 %t971, ptr %local.lambda2.898
  %t972 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.84)
  store i64 %t972, ptr %local.dt.899
  store i64 50000, ptr %local.max_s.900
  %t973 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.85)
  %t974 = ptrtoint ptr %t973 to i64
  %t975 = inttoptr i64 %t974 to ptr
  call void @intrinsic_println(ptr %t975)
  %t976 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.86)
  %t977 = ptrtoint ptr %t976 to i64
  %t978 = inttoptr i64 %t977 to ptr
  call void @intrinsic_println(ptr %t978)
  %t979 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.87)
  %t980 = ptrtoint ptr %t979 to i64
  %t981 = inttoptr i64 %t980 to ptr
  call void @intrinsic_println(ptr %t981)
  %t982 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.88)
  %t983 = ptrtoint ptr %t982 to i64
  %t984 = inttoptr i64 %t983 to ptr
  call void @intrinsic_println(ptr %t984)
  %t985 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.89)
  store i64 %t985, ptr %local.a_star_prev.901
  store i64 0, ptr %local.monotone_from.902
  store i64 0, ptr %local.monotone_count.903
  store i64 0, ptr %local.violation_count.904
  store i64 0, ptr %local.first_violation.905
  %t986 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.90)
  store i64 %t986, ptr %local.a_star_last.906
  %t987 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.91)
  store i64 %t987, ptr %local.a_star_8.907
  %t988 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.92)
  store i64 %t988, ptr %local.sum_n.908
  %t989 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.93)
  store i64 %t989, ptr %local.sum_a.909
  %t990 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.94)
  store i64 %t990, ptr %local.sum_nn.910
  %t991 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.95)
  store i64 %t991, ptr %local.sum_na.911
  %t992 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.96)
  store i64 %t992, ptr %local.reg_count.912
  store i64 0, ptr %local.ni.913
  br label %loop27
loop27:
  %t993 = load i64, ptr %local.ni.913
  %t994 = icmp slt i64 %t993, 12
  %t995 = zext i1 %t994 to i64
  %t996 = icmp ne i64 %t995, 0
  br i1 %t996, label %body27, label %endloop27
body27:
  store i64 6, ptr %local.n_modes.914
  %t997 = load i64, ptr %local.ni.913
  %t998 = icmp eq i64 %t997, 1
  %t999 = zext i1 %t998 to i64
  %t1000 = icmp ne i64 %t999, 0
  br i1 %t1000, label %then28, label %else28
then28:
  store i64 8, ptr %local.n_modes.914
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1001 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1002 = load i64, ptr %local.ni.913
  %t1003 = icmp eq i64 %t1002, 2
  %t1004 = zext i1 %t1003 to i64
  %t1005 = icmp ne i64 %t1004, 0
  br i1 %t1005, label %then29, label %else29
then29:
  store i64 10, ptr %local.n_modes.914
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1006 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t1007 = load i64, ptr %local.ni.913
  %t1008 = icmp eq i64 %t1007, 3
  %t1009 = zext i1 %t1008 to i64
  %t1010 = icmp ne i64 %t1009, 0
  br i1 %t1010, label %then30, label %else30
then30:
  store i64 12, ptr %local.n_modes.914
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1011 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1012 = load i64, ptr %local.ni.913
  %t1013 = icmp eq i64 %t1012, 4
  %t1014 = zext i1 %t1013 to i64
  %t1015 = icmp ne i64 %t1014, 0
  br i1 %t1015, label %then31, label %else31
then31:
  store i64 14, ptr %local.n_modes.914
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1016 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1017 = load i64, ptr %local.ni.913
  %t1018 = icmp eq i64 %t1017, 5
  %t1019 = zext i1 %t1018 to i64
  %t1020 = icmp ne i64 %t1019, 0
  br i1 %t1020, label %then32, label %else32
then32:
  store i64 16, ptr %local.n_modes.914
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1021 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1022 = load i64, ptr %local.ni.913
  %t1023 = icmp eq i64 %t1022, 6
  %t1024 = zext i1 %t1023 to i64
  %t1025 = icmp ne i64 %t1024, 0
  br i1 %t1025, label %then33, label %else33
then33:
  store i64 18, ptr %local.n_modes.914
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1026 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1027 = load i64, ptr %local.ni.913
  %t1028 = icmp eq i64 %t1027, 7
  %t1029 = zext i1 %t1028 to i64
  %t1030 = icmp ne i64 %t1029, 0
  br i1 %t1030, label %then34, label %else34
then34:
  store i64 20, ptr %local.n_modes.914
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1031 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1032 = load i64, ptr %local.ni.913
  %t1033 = icmp eq i64 %t1032, 8
  %t1034 = zext i1 %t1033 to i64
  %t1035 = icmp ne i64 %t1034, 0
  br i1 %t1035, label %then35, label %else35
then35:
  store i64 22, ptr %local.n_modes.914
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1036 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1037 = load i64, ptr %local.ni.913
  %t1038 = icmp eq i64 %t1037, 9
  %t1039 = zext i1 %t1038 to i64
  %t1040 = icmp ne i64 %t1039, 0
  br i1 %t1040, label %then36, label %else36
then36:
  store i64 24, ptr %local.n_modes.914
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1041 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1042 = load i64, ptr %local.ni.913
  %t1043 = icmp eq i64 %t1042, 10
  %t1044 = zext i1 %t1043 to i64
  %t1045 = icmp ne i64 %t1044, 0
  br i1 %t1045, label %then37, label %else37
then37:
  store i64 28, ptr %local.n_modes.914
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1046 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t1047 = load i64, ptr %local.ni.913
  %t1048 = icmp eq i64 %t1047, 11
  %t1049 = zext i1 %t1048 to i64
  %t1050 = icmp ne i64 %t1049, 0
  br i1 %t1050, label %then38, label %else38
then38:
  store i64 32, ptr %local.n_modes.914
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1051 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1052 = load i64, ptr %local.n_modes.914
  %t1053 = load i64, ptr %local.nu.895
  %t1054 = load i64, ptr %local.sigma.896
  %t1055 = load i64, ptr %local.lambda.897
  %t1056 = load i64, ptr %local.lambda2.898
  %t1057 = load i64, ptr %local.dt.899
  %t1058 = load i64, ptr %local.max_s.900
  %t1059 = call i64 @"find_a_star"(i64 %t1052, i64 %t1053, i64 %t1054, i64 %t1055, i64 %t1056, i64 %t1057, i64 %t1058)
  store i64 %t1059, ptr %local.a_star.915
  %t1060 = load i64, ptr %local.n_modes.914
  %t1061 = call i64 @"sx_int_to_f64"(i64 %t1060)
  store i64 %t1061, ptr %local.n.916
  %t1062 = load i64, ptr %local.nu.895
  %t1063 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.97)
  %t1064 = load i64, ptr %local.n.916
  %t1065 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.98)
  %t1066 = call i64 @"sx_f64_sub"(i64 %t1064, i64 %t1065)
  %t1067 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.99)
  %t1068 = call i64 @"sx_f64_div"(i64 %t1066, i64 %t1067)
  %t1069 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.100)
  %t1070 = call i64 @"sx_f64_mul"(i64 %t1068, i64 %t1069)
  %t1071 = call i64 @"sx_f64_add"(i64 %t1063, i64 %t1070)
  %t1072 = call i64 @"sx_f64_mul"(i64 %t1062, i64 %t1071)
  store i64 %t1072, ptr %local.nu_e.917
  %t1073 = load i64, ptr %local.sigma.896
  %t1074 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.101)
  %t1075 = load i64, ptr %local.n.916
  %t1076 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.102)
  %t1077 = call i64 @"sx_f64_sub"(i64 %t1075, i64 %t1076)
  %t1078 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.103)
  %t1079 = call i64 @"sx_f64_div"(i64 %t1077, i64 %t1078)
  %t1080 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.104)
  %t1081 = call i64 @"sx_f64_mul"(i64 %t1079, i64 %t1080)
  %t1082 = call i64 @"sx_f64_add"(i64 %t1074, i64 %t1081)
  %t1083 = call i64 @"sx_f64_mul"(i64 %t1073, i64 %t1082)
  store i64 %t1083, ptr %local.sigma_e.918
  %t1084 = load i64, ptr %local.a_star.915
  %t1085 = load i64, ptr %local.nu_e.917
  %t1086 = load i64, ptr %local.sigma_e.918
  %t1087 = load i64, ptr %local.lambda.897
  %t1088 = load i64, ptr %local.lambda2.898
  %t1089 = load i64, ptr %local.dt.899
  %t1090 = load i64, ptr %local.max_s.900
  %t1091 = call i64 @"find_bottleneck"(i64 %t1084, i64 %t1085, i64 %t1086, i64 %t1087, i64 %t1088, i64 %t1089, i64 %t1090)
  store i64 %t1091, ptr %local.bottleneck.919
  %t1092 = load i64, ptr %local.a_star.915
  %t1093 = load i64, ptr %local.nu_e.917
  %t1094 = load i64, ptr %local.sigma_e.918
  %t1095 = load i64, ptr %local.lambda.897
  %t1096 = load i64, ptr %local.lambda2.898
  %t1097 = load i64, ptr %local.dt.899
  %t1098 = load i64, ptr %local.max_s.900
  %t1099 = load i64, ptr %local.bottleneck.919
  %t1100 = call i64 @"mode_analysis_6"(i64 %t1092, i64 %t1093, i64 %t1094, i64 %t1095, i64 %t1096, i64 %t1097, i64 %t1098, i64 %t1099, i64 0)
  store i64 %t1100, ptr %local.stretch.920
  %t1101 = load i64, ptr %local.a_star.915
  %t1102 = load i64, ptr %local.nu_e.917
  %t1103 = load i64, ptr %local.sigma_e.918
  %t1104 = load i64, ptr %local.lambda.897
  %t1105 = load i64, ptr %local.lambda2.898
  %t1106 = load i64, ptr %local.dt.899
  %t1107 = load i64, ptr %local.max_s.900
  %t1108 = load i64, ptr %local.bottleneck.919
  %t1109 = call i64 @"mode_analysis_6"(i64 %t1101, i64 %t1102, i64 %t1103, i64 %t1104, i64 %t1105, i64 %t1106, i64 %t1107, i64 %t1108, i64 1)
  store i64 %t1109, ptr %local.diffuse.921
  %t1110 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.105)
  store i64 %t1110, ptr %local.a_change.922
  %t1111 = load i64, ptr %local.ni.913
  %t1112 = icmp sgt i64 %t1111, 0
  %t1113 = zext i1 %t1112 to i64
  %t1114 = icmp ne i64 %t1113, 0
  br i1 %t1114, label %then39, label %else39
then39:
  %t1115 = load i64, ptr %local.a_star.915
  %t1116 = load i64, ptr %local.a_star_prev.901
  %t1117 = call i64 @"sx_f64_sub"(i64 %t1115, i64 %t1116)
  store i64 %t1117, ptr %local.a_change.922
  %t1118 = load i64, ptr %local.a_change.922
  %t1119 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.106)
  %t1120 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.107)
  %t1121 = call i64 @"sx_f64_sub"(i64 %t1119, i64 %t1120)
  %t1122 = call i64 @"sx_f64_ge"(i64 %t1118, i64 %t1121)
  %t1123 = icmp ne i64 %t1122, 0
  br i1 %t1123, label %then40, label %else40
then40:
  %t1124 = load i64, ptr %local.monotone_count.903
  %t1125 = add i64 %t1124, 1
  store i64 %t1125, ptr %local.monotone_count.903
  br label %then40_end
then40_end:
  br label %endif40
else40:
  %t1126 = load i64, ptr %local.violation_count.904
  %t1127 = add i64 %t1126, 1
  store i64 %t1127, ptr %local.violation_count.904
  %t1128 = load i64, ptr %local.first_violation.905
  %t1129 = icmp eq i64 %t1128, 0
  %t1130 = zext i1 %t1129 to i64
  %t1131 = icmp ne i64 %t1130, 0
  br i1 %t1131, label %then41, label %else41
then41:
  %t1132 = load i64, ptr %local.n_modes.914
  store i64 %t1132, ptr %local.first_violation.905
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1133 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1134 = phi i64 [ 0, %then40_end ], [ %t1133, %else40_end ]
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1135 = phi i64 [ %t1134, %then39_end ], [ 0, %else39_end ]
  %t1136 = load i64, ptr %local.a_star.915
  store i64 %t1136, ptr %local.a_star_prev.901
  %t1137 = load i64, ptr %local.a_star.915
  store i64 %t1137, ptr %local.a_star_last.906
  %t1138 = load i64, ptr %local.ni.913
  %t1139 = icmp eq i64 %t1138, 1
  %t1140 = zext i1 %t1139 to i64
  %t1141 = icmp ne i64 %t1140, 0
  br i1 %t1141, label %then42, label %else42
then42:
  %t1142 = load i64, ptr %local.a_star.915
  store i64 %t1142, ptr %local.a_star_8.907
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1143 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t1144 = load i64, ptr %local.ni.913
  %t1145 = icmp sgt i64 %t1144, 0
  %t1146 = zext i1 %t1145 to i64
  %t1147 = icmp ne i64 %t1146, 0
  br i1 %t1147, label %then43, label %else43
then43:
  %t1148 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.108)
  %t1149 = load i64, ptr %local.n.916
  %t1150 = call i64 @"sx_f64_div"(i64 %t1148, i64 %t1149)
  store i64 %t1150, ptr %local.inv_n.923
  %t1151 = load i64, ptr %local.sum_n.908
  %t1152 = load i64, ptr %local.inv_n.923
  %t1153 = call i64 @"sx_f64_add"(i64 %t1151, i64 %t1152)
  store i64 %t1153, ptr %local.sum_n.908
  %t1154 = load i64, ptr %local.sum_a.909
  %t1155 = load i64, ptr %local.a_star.915
  %t1156 = call i64 @"sx_f64_add"(i64 %t1154, i64 %t1155)
  store i64 %t1156, ptr %local.sum_a.909
  %t1157 = load i64, ptr %local.sum_nn.910
  %t1158 = load i64, ptr %local.inv_n.923
  %t1159 = load i64, ptr %local.inv_n.923
  %t1160 = call i64 @"sx_f64_mul"(i64 %t1158, i64 %t1159)
  %t1161 = call i64 @"sx_f64_add"(i64 %t1157, i64 %t1160)
  store i64 %t1161, ptr %local.sum_nn.910
  %t1162 = load i64, ptr %local.sum_na.911
  %t1163 = load i64, ptr %local.inv_n.923
  %t1164 = load i64, ptr %local.a_star.915
  %t1165 = call i64 @"sx_f64_mul"(i64 %t1163, i64 %t1164)
  %t1166 = call i64 @"sx_f64_add"(i64 %t1162, i64 %t1165)
  store i64 %t1166, ptr %local.sum_na.911
  %t1167 = load i64, ptr %local.reg_count.912
  %t1168 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.109)
  %t1169 = call i64 @"sx_f64_add"(i64 %t1167, i64 %t1168)
  store i64 %t1169, ptr %local.reg_count.912
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1170 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t1171 = load i64, ptr %local.bottleneck.919
  %t1172 = add i64 %t1171, 1
  store i64 %t1172, ptr %local.bk.924
  %t1173 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.110)
  %t1174 = ptrtoint ptr %t1173 to i64
  %t1175 = inttoptr i64 %t1174 to ptr
  call void @intrinsic_print(ptr %t1175)
  %t1176 = load i64, ptr %local.n_modes.914
  call void @print_i64(i64 %t1176)
  %t1177 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.111)
  %t1178 = ptrtoint ptr %t1177 to i64
  %t1179 = inttoptr i64 %t1178 to ptr
  call void @intrinsic_print(ptr %t1179)
  %t1180 = load i64, ptr %local.a_star.915
  %t1181 = call i64 @"print_f64"(i64 %t1180)
  %t1182 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.112)
  %t1183 = ptrtoint ptr %t1182 to i64
  %t1184 = inttoptr i64 %t1183 to ptr
  call void @intrinsic_print(ptr %t1184)
  %t1185 = load i64, ptr %local.bk.924
  call void @print_i64(i64 %t1185)
  %t1186 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.113)
  %t1187 = ptrtoint ptr %t1186 to i64
  %t1188 = inttoptr i64 %t1187 to ptr
  call void @intrinsic_print(ptr %t1188)
  %t1189 = load i64, ptr %local.stretch.920
  %t1190 = call i64 @"print_f64"(i64 %t1189)
  %t1191 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.114)
  %t1192 = ptrtoint ptr %t1191 to i64
  %t1193 = inttoptr i64 %t1192 to ptr
  call void @intrinsic_print(ptr %t1193)
  %t1194 = load i64, ptr %local.diffuse.921
  %t1195 = call i64 @"print_f64"(i64 %t1194)
  %t1196 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.115)
  %t1197 = ptrtoint ptr %t1196 to i64
  %t1198 = inttoptr i64 %t1197 to ptr
  call void @intrinsic_print(ptr %t1198)
  %t1199 = load i64, ptr %local.ni.913
  %t1200 = icmp sgt i64 %t1199, 0
  %t1201 = zext i1 %t1200 to i64
  %t1202 = icmp ne i64 %t1201, 0
  br i1 %t1202, label %then44, label %else44
then44:
  %t1203 = load i64, ptr %local.a_change.922
  %t1204 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.116)
  %t1205 = call i64 @"sx_f64_ge"(i64 %t1203, i64 %t1204)
  %t1206 = icmp ne i64 %t1205, 0
  br i1 %t1206, label %then45, label %else45
then45:
  %t1207 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.117)
  %t1208 = ptrtoint ptr %t1207 to i64
  %t1209 = inttoptr i64 %t1208 to ptr
  call void @intrinsic_print(ptr %t1209)
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1210 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t1211 = load i64, ptr %local.a_change.922
  %t1212 = call i64 @"print_f64"(i64 %t1211)
  br label %then44_end
then44_end:
  br label %endif44
else44:
  %t1213 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.118)
  %t1214 = ptrtoint ptr %t1213 to i64
  %t1215 = inttoptr i64 %t1214 to ptr
  call void @intrinsic_print(ptr %t1215)
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1216 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t1217 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.119)
  %t1218 = ptrtoint ptr %t1217 to i64
  %t1219 = inttoptr i64 %t1218 to ptr
  call void @intrinsic_println(ptr %t1219)
  %t1220 = load i64, ptr %local.ni.913
  %t1221 = add i64 %t1220, 1
  store i64 %t1221, ptr %local.ni.913
  br label %loop27
endloop27:
  %t1222 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.120)
  %t1223 = ptrtoint ptr %t1222 to i64
  %t1224 = inttoptr i64 %t1223 to ptr
  call void @intrinsic_println(ptr %t1224)
  %t1225 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.121)
  %t1226 = ptrtoint ptr %t1225 to i64
  %t1227 = inttoptr i64 %t1226 to ptr
  call void @intrinsic_println(ptr %t1227)
  %t1228 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.122)
  %t1229 = ptrtoint ptr %t1228 to i64
  %t1230 = inttoptr i64 %t1229 to ptr
  call void @intrinsic_println(ptr %t1230)
  %t1231 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.123)
  %t1232 = ptrtoint ptr %t1231 to i64
  %t1233 = inttoptr i64 %t1232 to ptr
  call void @intrinsic_print(ptr %t1233)
  %t1234 = load i64, ptr %local.monotone_count.903
  call void @print_i64(i64 %t1234)
  %t1235 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.124)
  %t1236 = ptrtoint ptr %t1235 to i64
  %t1237 = inttoptr i64 %t1236 to ptr
  call void @intrinsic_println(ptr %t1237)
  %t1238 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.125)
  %t1239 = ptrtoint ptr %t1238 to i64
  %t1240 = inttoptr i64 %t1239 to ptr
  call void @intrinsic_print(ptr %t1240)
  %t1241 = load i64, ptr %local.violation_count.904
  call void @print_i64(i64 %t1241)
  %t1242 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.126)
  %t1243 = ptrtoint ptr %t1242 to i64
  %t1244 = inttoptr i64 %t1243 to ptr
  call void @intrinsic_println(ptr %t1244)
  %t1245 = load i64, ptr %local.violation_count.904
  %t1246 = icmp eq i64 %t1245, 0
  %t1247 = zext i1 %t1246 to i64
  %t1248 = icmp ne i64 %t1247, 0
  br i1 %t1248, label %then46, label %else46
then46:
  %t1249 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.127)
  %t1250 = ptrtoint ptr %t1249 to i64
  %t1251 = inttoptr i64 %t1250 to ptr
  call void @intrinsic_println(ptr %t1251)
  %t1252 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.128)
  %t1253 = ptrtoint ptr %t1252 to i64
  %t1254 = inttoptr i64 %t1253 to ptr
  call void @intrinsic_println(ptr %t1254)
  br label %then46_end
then46_end:
  br label %endif46
else46:
  %t1255 = load i64, ptr %local.first_violation.905
  %t1256 = icmp sgt i64 %t1255, 8
  %t1257 = zext i1 %t1256 to i64
  %t1258 = icmp ne i64 %t1257, 0
  br i1 %t1258, label %then47, label %else47
then47:
  %t1259 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.129)
  %t1260 = ptrtoint ptr %t1259 to i64
  %t1261 = inttoptr i64 %t1260 to ptr
  call void @intrinsic_print(ptr %t1261)
  %t1262 = load i64, ptr %local.first_violation.905
  call void @print_i64(i64 %t1262)
  %t1263 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.130)
  %t1264 = ptrtoint ptr %t1263 to i64
  %t1265 = inttoptr i64 %t1264 to ptr
  call void @intrinsic_println(ptr %t1265)
  %t1266 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.131)
  %t1267 = ptrtoint ptr %t1266 to i64
  %t1268 = inttoptr i64 %t1267 to ptr
  call void @intrinsic_println(ptr %t1268)
  br label %then47_end
then47_end:
  br label %endif47
else47:
  %t1269 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.132)
  %t1270 = ptrtoint ptr %t1269 to i64
  %t1271 = inttoptr i64 %t1270 to ptr
  call void @intrinsic_println(ptr %t1271)
  %t1272 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.133)
  %t1273 = ptrtoint ptr %t1272 to i64
  %t1274 = inttoptr i64 %t1273 to ptr
  call void @intrinsic_println(ptr %t1274)
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1275 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1276 = phi i64 [ 0, %then46_end ], [ %t1275, %else46_end ]
  %t1277 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.134)
  %t1278 = ptrtoint ptr %t1277 to i64
  %t1279 = inttoptr i64 %t1278 to ptr
  call void @intrinsic_println(ptr %t1279)
  %t1280 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.135)
  %t1281 = ptrtoint ptr %t1280 to i64
  %t1282 = inttoptr i64 %t1281 to ptr
  call void @intrinsic_println(ptr %t1282)
  %t1283 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.136)
  %t1284 = ptrtoint ptr %t1283 to i64
  %t1285 = inttoptr i64 %t1284 to ptr
  call void @intrinsic_println(ptr %t1285)
  %t1286 = load i64, ptr %local.sum_n.908
  %t1287 = load i64, ptr %local.reg_count.912
  %t1288 = call i64 @"sx_f64_div"(i64 %t1286, i64 %t1287)
  store i64 %t1288, ptr %local.mean_n.925
  %t1289 = load i64, ptr %local.sum_a.909
  %t1290 = load i64, ptr %local.reg_count.912
  %t1291 = call i64 @"sx_f64_div"(i64 %t1289, i64 %t1290)
  store i64 %t1291, ptr %local.mean_a.926
  %t1292 = load i64, ptr %local.sum_nn.910
  %t1293 = load i64, ptr %local.reg_count.912
  %t1294 = load i64, ptr %local.mean_n.925
  %t1295 = call i64 @"sx_f64_mul"(i64 %t1293, i64 %t1294)
  %t1296 = load i64, ptr %local.mean_n.925
  %t1297 = call i64 @"sx_f64_mul"(i64 %t1295, i64 %t1296)
  %t1298 = call i64 @"sx_f64_sub"(i64 %t1292, i64 %t1297)
  store i64 %t1298, ptr %local.ss_nn.927
  %t1299 = load i64, ptr %local.sum_na.911
  %t1300 = load i64, ptr %local.reg_count.912
  %t1301 = load i64, ptr %local.mean_n.925
  %t1302 = call i64 @"sx_f64_mul"(i64 %t1300, i64 %t1301)
  %t1303 = load i64, ptr %local.mean_a.926
  %t1304 = call i64 @"sx_f64_mul"(i64 %t1302, i64 %t1303)
  %t1305 = call i64 @"sx_f64_sub"(i64 %t1299, i64 %t1304)
  store i64 %t1305, ptr %local.ss_na.928
  %t1306 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.137)
  store i64 %t1306, ptr %local.c_conv.929
  %t1307 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.138)
  store i64 %t1307, ptr %local.a_inf.930
  %t1308 = load i64, ptr %local.ss_nn.927
  %t1309 = call i64 @"abs_f64"(i64 %t1308)
  %t1310 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.139)
  %t1311 = call i64 @"sx_f64_gt"(i64 %t1309, i64 %t1310)
  %t1312 = icmp ne i64 %t1311, 0
  br i1 %t1312, label %then48, label %else48
then48:
  %t1313 = load i64, ptr %local.ss_na.928
  %t1314 = load i64, ptr %local.ss_nn.927
  %t1315 = call i64 @"sx_f64_div"(i64 %t1313, i64 %t1314)
  store i64 %t1315, ptr %local.c_conv.929
  %t1316 = load i64, ptr %local.mean_a.926
  %t1317 = load i64, ptr %local.c_conv.929
  %t1318 = load i64, ptr %local.mean_n.925
  %t1319 = call i64 @"sx_f64_mul"(i64 %t1317, i64 %t1318)
  %t1320 = call i64 @"sx_f64_sub"(i64 %t1316, i64 %t1319)
  store i64 %t1320, ptr %local.a_inf.930
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1321 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1322 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.140)
  %t1323 = ptrtoint ptr %t1322 to i64
  %t1324 = inttoptr i64 %t1323 to ptr
  call void @intrinsic_print(ptr %t1324)
  %t1325 = load i64, ptr %local.a_inf.930
  %t1326 = call i64 @"print_f64"(i64 %t1325)
  %t1327 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.141)
  %t1328 = ptrtoint ptr %t1327 to i64
  %t1329 = inttoptr i64 %t1328 to ptr
  call void @intrinsic_print(ptr %t1329)
  %t1330 = load i64, ptr %local.c_conv.929
  %t1331 = call i64 @"print_f64"(i64 %t1330)
  %t1332 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.142)
  %t1333 = ptrtoint ptr %t1332 to i64
  %t1334 = inttoptr i64 %t1333 to ptr
  call void @intrinsic_println(ptr %t1334)
  %t1335 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.143)
  %t1336 = ptrtoint ptr %t1335 to i64
  %t1337 = inttoptr i64 %t1336 to ptr
  call void @intrinsic_println(ptr %t1337)
  %t1338 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.144)
  %t1339 = ptrtoint ptr %t1338 to i64
  %t1340 = inttoptr i64 %t1339 to ptr
  call void @intrinsic_print(ptr %t1340)
  %t1341 = load i64, ptr %local.a_inf.930
  %t1342 = call i64 @"print_f64"(i64 %t1341)
  %t1343 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.145)
  %t1344 = ptrtoint ptr %t1343 to i64
  %t1345 = inttoptr i64 %t1344 to ptr
  call void @intrinsic_println(ptr %t1345)
  %t1346 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.146)
  %t1347 = ptrtoint ptr %t1346 to i64
  %t1348 = inttoptr i64 %t1347 to ptr
  call void @intrinsic_print(ptr %t1348)
  %t1349 = load i64, ptr %local.c_conv.929
  %t1350 = call i64 @"print_f64"(i64 %t1349)
  %t1351 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.147)
  %t1352 = ptrtoint ptr %t1351 to i64
  %t1353 = inttoptr i64 %t1352 to ptr
  call void @intrinsic_println(ptr %t1353)
  %t1354 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.148)
  %t1355 = ptrtoint ptr %t1354 to i64
  %t1356 = inttoptr i64 %t1355 to ptr
  call void @intrinsic_println(ptr %t1356)
  %t1357 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.149)
  %t1358 = ptrtoint ptr %t1357 to i64
  %t1359 = inttoptr i64 %t1358 to ptr
  call void @intrinsic_println(ptr %t1359)
  %t1360 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.150)
  %t1361 = ptrtoint ptr %t1360 to i64
  %t1362 = inttoptr i64 %t1361 to ptr
  call void @intrinsic_println(ptr %t1362)
  store i64 0, ptr %local.ni.913
  br label %loop49
loop49:
  %t1363 = load i64, ptr %local.ni.913
  %t1364 = icmp slt i64 %t1363, 12
  %t1365 = zext i1 %t1364 to i64
  %t1366 = icmp ne i64 %t1365, 0
  br i1 %t1366, label %body49, label %endloop49
body49:
  store i64 6, ptr %local.n_modes.931
  %t1367 = load i64, ptr %local.ni.913
  %t1368 = icmp eq i64 %t1367, 1
  %t1369 = zext i1 %t1368 to i64
  %t1370 = icmp ne i64 %t1369, 0
  br i1 %t1370, label %then50, label %else50
then50:
  store i64 8, ptr %local.n_modes.931
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1371 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1372 = load i64, ptr %local.ni.913
  %t1373 = icmp eq i64 %t1372, 2
  %t1374 = zext i1 %t1373 to i64
  %t1375 = icmp ne i64 %t1374, 0
  br i1 %t1375, label %then51, label %else51
then51:
  store i64 10, ptr %local.n_modes.931
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1376 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t1377 = load i64, ptr %local.ni.913
  %t1378 = icmp eq i64 %t1377, 3
  %t1379 = zext i1 %t1378 to i64
  %t1380 = icmp ne i64 %t1379, 0
  br i1 %t1380, label %then52, label %else52
then52:
  store i64 12, ptr %local.n_modes.931
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1381 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t1382 = load i64, ptr %local.ni.913
  %t1383 = icmp eq i64 %t1382, 4
  %t1384 = zext i1 %t1383 to i64
  %t1385 = icmp ne i64 %t1384, 0
  br i1 %t1385, label %then53, label %else53
then53:
  store i64 14, ptr %local.n_modes.931
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1386 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t1387 = load i64, ptr %local.ni.913
  %t1388 = icmp eq i64 %t1387, 5
  %t1389 = zext i1 %t1388 to i64
  %t1390 = icmp ne i64 %t1389, 0
  br i1 %t1390, label %then54, label %else54
then54:
  store i64 16, ptr %local.n_modes.931
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t1391 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t1392 = load i64, ptr %local.ni.913
  %t1393 = icmp eq i64 %t1392, 6
  %t1394 = zext i1 %t1393 to i64
  %t1395 = icmp ne i64 %t1394, 0
  br i1 %t1395, label %then55, label %else55
then55:
  store i64 18, ptr %local.n_modes.931
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t1396 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t1397 = load i64, ptr %local.ni.913
  %t1398 = icmp eq i64 %t1397, 7
  %t1399 = zext i1 %t1398 to i64
  %t1400 = icmp ne i64 %t1399, 0
  br i1 %t1400, label %then56, label %else56
then56:
  store i64 20, ptr %local.n_modes.931
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t1401 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t1402 = load i64, ptr %local.ni.913
  %t1403 = icmp eq i64 %t1402, 8
  %t1404 = zext i1 %t1403 to i64
  %t1405 = icmp ne i64 %t1404, 0
  br i1 %t1405, label %then57, label %else57
then57:
  store i64 22, ptr %local.n_modes.931
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t1406 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t1407 = load i64, ptr %local.ni.913
  %t1408 = icmp eq i64 %t1407, 9
  %t1409 = zext i1 %t1408 to i64
  %t1410 = icmp ne i64 %t1409, 0
  br i1 %t1410, label %then58, label %else58
then58:
  store i64 24, ptr %local.n_modes.931
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t1411 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t1412 = load i64, ptr %local.ni.913
  %t1413 = icmp eq i64 %t1412, 10
  %t1414 = zext i1 %t1413 to i64
  %t1415 = icmp ne i64 %t1414, 0
  br i1 %t1415, label %then59, label %else59
then59:
  store i64 28, ptr %local.n_modes.931
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t1416 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t1417 = load i64, ptr %local.ni.913
  %t1418 = icmp eq i64 %t1417, 11
  %t1419 = zext i1 %t1418 to i64
  %t1420 = icmp ne i64 %t1419, 0
  br i1 %t1420, label %then60, label %else60
then60:
  store i64 32, ptr %local.n_modes.931
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t1421 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t1422 = load i64, ptr %local.n_modes.931
  %t1423 = load i64, ptr %local.nu.895
  %t1424 = load i64, ptr %local.sigma.896
  %t1425 = load i64, ptr %local.lambda.897
  %t1426 = load i64, ptr %local.lambda2.898
  %t1427 = load i64, ptr %local.dt.899
  %t1428 = load i64, ptr %local.max_s.900
  %t1429 = call i64 @"find_a_star"(i64 %t1422, i64 %t1423, i64 %t1424, i64 %t1425, i64 %t1426, i64 %t1427, i64 %t1428)
  store i64 %t1429, ptr %local.a_star.932
  %t1430 = load i64, ptr %local.a_star.932
  %t1431 = load i64, ptr %local.a_inf.930
  %t1432 = call i64 @"sx_f64_sub"(i64 %t1430, i64 %t1431)
  %t1433 = call i64 @"abs_f64"(i64 %t1432)
  store i64 %t1433, ptr %local.deviation.933
  %t1434 = load i64, ptr %local.a_inf.930
  %t1435 = load i64, ptr %local.c_conv.929
  %t1436 = load i64, ptr %local.n_modes.931
  %t1437 = call i64 @"sx_int_to_f64"(i64 %t1436)
  %t1438 = call i64 @"sx_f64_div"(i64 %t1435, i64 %t1437)
  %t1439 = call i64 @"sx_f64_add"(i64 %t1434, i64 %t1438)
  store i64 %t1439, ptr %local.predicted.934
  %t1440 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.151)
  %t1441 = ptrtoint ptr %t1440 to i64
  %t1442 = inttoptr i64 %t1441 to ptr
  call void @intrinsic_print(ptr %t1442)
  %t1443 = load i64, ptr %local.n_modes.931
  call void @print_i64(i64 %t1443)
  %t1444 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.152)
  %t1445 = ptrtoint ptr %t1444 to i64
  %t1446 = inttoptr i64 %t1445 to ptr
  call void @intrinsic_print(ptr %t1446)
  %t1447 = load i64, ptr %local.a_star.932
  %t1448 = call i64 @"print_f64"(i64 %t1447)
  %t1449 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.153)
  %t1450 = ptrtoint ptr %t1449 to i64
  %t1451 = inttoptr i64 %t1450 to ptr
  call void @intrinsic_print(ptr %t1451)
  %t1452 = load i64, ptr %local.deviation.933
  %t1453 = call i64 @"print_f64"(i64 %t1452)
  %t1454 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.154)
  %t1455 = ptrtoint ptr %t1454 to i64
  %t1456 = inttoptr i64 %t1455 to ptr
  call void @intrinsic_print(ptr %t1456)
  %t1457 = load i64, ptr %local.predicted.934
  %t1458 = call i64 @"print_f64"(i64 %t1457)
  %t1459 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.155)
  %t1460 = ptrtoint ptr %t1459 to i64
  %t1461 = inttoptr i64 %t1460 to ptr
  call void @intrinsic_println(ptr %t1461)
  %t1462 = load i64, ptr %local.ni.913
  %t1463 = add i64 %t1462, 1
  store i64 %t1463, ptr %local.ni.913
  br label %loop49
endloop49:
  %t1464 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.156)
  %t1465 = ptrtoint ptr %t1464 to i64
  %t1466 = inttoptr i64 %t1465 to ptr
  call void @intrinsic_println(ptr %t1466)
  %t1467 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.157)
  %t1468 = ptrtoint ptr %t1467 to i64
  %t1469 = inttoptr i64 %t1468 to ptr
  call void @intrinsic_println(ptr %t1469)
  %t1470 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.158)
  %t1471 = ptrtoint ptr %t1470 to i64
  %t1472 = inttoptr i64 %t1471 to ptr
  call void @intrinsic_println(ptr %t1472)
  %t1473 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.159)
  %t1474 = ptrtoint ptr %t1473 to i64
  %t1475 = inttoptr i64 %t1474 to ptr
  call void @intrinsic_print(ptr %t1475)
  %t1476 = load i64, ptr %local.nu.895
  %t1477 = load i64, ptr %local.sigma.896
  %t1478 = load i64, ptr %local.lambda.897
  %t1479 = load i64, ptr %local.lambda2.898
  %t1480 = load i64, ptr %local.dt.899
  %t1481 = load i64, ptr %local.max_s.900
  %t1482 = call i64 @"find_a_star"(i64 6, i64 %t1476, i64 %t1477, i64 %t1478, i64 %t1479, i64 %t1480, i64 %t1481)
  %t1483 = call i64 @"print_f64"(i64 %t1482)
  %t1484 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.160)
  %t1485 = ptrtoint ptr %t1484 to i64
  %t1486 = inttoptr i64 %t1485 to ptr
  call void @intrinsic_println(ptr %t1486)
  %t1487 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.161)
  %t1488 = ptrtoint ptr %t1487 to i64
  %t1489 = inttoptr i64 %t1488 to ptr
  call void @intrinsic_print(ptr %t1489)
  %t1490 = load i64, ptr %local.a_star_last.906
  %t1491 = call i64 @"print_f64"(i64 %t1490)
  %t1492 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.162)
  %t1493 = ptrtoint ptr %t1492 to i64
  %t1494 = inttoptr i64 %t1493 to ptr
  call void @intrinsic_println(ptr %t1494)
  %t1495 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.163)
  %t1496 = ptrtoint ptr %t1495 to i64
  %t1497 = inttoptr i64 %t1496 to ptr
  call void @intrinsic_print(ptr %t1497)
  %t1498 = load i64, ptr %local.a_inf.930
  %t1499 = call i64 @"print_f64"(i64 %t1498)
  %t1500 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.164)
  %t1501 = ptrtoint ptr %t1500 to i64
  %t1502 = inttoptr i64 %t1501 to ptr
  call void @intrinsic_println(ptr %t1502)
  %t1503 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.165)
  %t1504 = ptrtoint ptr %t1503 to i64
  %t1505 = inttoptr i64 %t1504 to ptr
  call void @intrinsic_println(ptr %t1505)
  %t1506 = load i64, ptr %local.a_inf.930
  %t1507 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.166)
  %t1508 = call i64 @"sx_f64_gt"(i64 %t1506, i64 %t1507)
  %t1509 = icmp ne i64 %t1508, 0
  br i1 %t1509, label %then61, label %else61
then61:
  %t1510 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.167)
  %t1511 = ptrtoint ptr %t1510 to i64
  %t1512 = inttoptr i64 %t1511 to ptr
  call void @intrinsic_println(ptr %t1512)
  %t1513 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.168)
  %t1514 = ptrtoint ptr %t1513 to i64
  %t1515 = inttoptr i64 %t1514 to ptr
  call void @intrinsic_println(ptr %t1515)
  %t1516 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.169)
  %t1517 = ptrtoint ptr %t1516 to i64
  %t1518 = inttoptr i64 %t1517 to ptr
  call void @intrinsic_println(ptr %t1518)
  %t1519 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.170)
  %t1520 = ptrtoint ptr %t1519 to i64
  %t1521 = inttoptr i64 %t1520 to ptr
  call void @intrinsic_println(ptr %t1521)
  %t1522 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.171)
  %t1523 = ptrtoint ptr %t1522 to i64
  %t1524 = inttoptr i64 %t1523 to ptr
  call void @intrinsic_println(ptr %t1524)
  %t1525 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.172)
  %t1526 = ptrtoint ptr %t1525 to i64
  %t1527 = inttoptr i64 %t1526 to ptr
  call void @intrinsic_println(ptr %t1527)
  %t1528 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.173)
  %t1529 = ptrtoint ptr %t1528 to i64
  %t1530 = inttoptr i64 %t1529 to ptr
  call void @intrinsic_println(ptr %t1530)
  %t1531 = load i64, ptr %local.c_conv.929
  %t1532 = call i64 @f64_parse(ptr @.str.exp_ns_monotonicity.174)
  %t1533 = call i64 @"sx_f64_gt"(i64 %t1531, i64 %t1532)
  %t1534 = icmp ne i64 %t1533, 0
  br i1 %t1534, label %then62, label %else62
then62:
  %t1535 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.175)
  %t1536 = ptrtoint ptr %t1535 to i64
  %t1537 = inttoptr i64 %t1536 to ptr
  call void @intrinsic_println(ptr %t1537)
  %t1538 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.176)
  %t1539 = ptrtoint ptr %t1538 to i64
  %t1540 = inttoptr i64 %t1539 to ptr
  call void @intrinsic_println(ptr %t1540)
  br label %then62_end
then62_end:
  br label %endif62
else62:
  %t1541 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.177)
  %t1542 = ptrtoint ptr %t1541 to i64
  %t1543 = inttoptr i64 %t1542 to ptr
  call void @intrinsic_println(ptr %t1543)
  %t1544 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.178)
  %t1545 = ptrtoint ptr %t1544 to i64
  %t1546 = inttoptr i64 %t1545 to ptr
  call void @intrinsic_println(ptr %t1546)
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t1547 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  br label %then61_end
then61_end:
  br label %endif61
else61:
  %t1548 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.179)
  %t1549 = ptrtoint ptr %t1548 to i64
  %t1550 = inttoptr i64 %t1549 to ptr
  call void @intrinsic_println(ptr %t1550)
  %t1551 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.180)
  %t1552 = ptrtoint ptr %t1551 to i64
  %t1553 = inttoptr i64 %t1552 to ptr
  call void @intrinsic_println(ptr %t1553)
  %t1554 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.181)
  %t1555 = ptrtoint ptr %t1554 to i64
  %t1556 = inttoptr i64 %t1555 to ptr
  call void @intrinsic_println(ptr %t1556)
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t1557 = phi i64 [ %t1547, %then61_end ], [ 0, %else61_end ]
  %t1558 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.182)
  %t1559 = ptrtoint ptr %t1558 to i64
  %t1560 = inttoptr i64 %t1559 to ptr
  call void @intrinsic_println(ptr %t1560)
  %t1561 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.183)
  %t1562 = ptrtoint ptr %t1561 to i64
  %t1563 = inttoptr i64 %t1562 to ptr
  call void @intrinsic_println(ptr %t1563)
  %t1564 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.184)
  %t1565 = ptrtoint ptr %t1564 to i64
  %t1566 = inttoptr i64 %t1565 to ptr
  call void @intrinsic_println(ptr %t1566)
  %t1567 = load i64, ptr %local.violation_count.904
  %t1568 = icmp eq i64 %t1567, 0
  %t1569 = zext i1 %t1568 to i64
  %t1570 = icmp ne i64 %t1569, 0
  br i1 %t1570, label %then63, label %else63
then63:
  %t1571 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.185)
  %t1572 = ptrtoint ptr %t1571 to i64
  %t1573 = inttoptr i64 %t1572 to ptr
  call void @intrinsic_println(ptr %t1573)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  %t1574 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.186)
  %t1575 = ptrtoint ptr %t1574 to i64
  %t1576 = inttoptr i64 %t1575 to ptr
  call void @intrinsic_println(ptr %t1576)
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1577 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t1578 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.187)
  %t1579 = ptrtoint ptr %t1578 to i64
  %t1580 = inttoptr i64 %t1579 to ptr
  call void @intrinsic_print(ptr %t1580)
  %t1581 = load i64, ptr %local.a_inf.930
  %t1582 = call i64 @"print_f64"(i64 %t1581)
  %t1583 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.188)
  %t1584 = ptrtoint ptr %t1583 to i64
  %t1585 = inttoptr i64 %t1584 to ptr
  call void @intrinsic_println(ptr %t1585)
  %t1586 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.189)
  %t1587 = ptrtoint ptr %t1586 to i64
  %t1588 = inttoptr i64 %t1587 to ptr
  call void @intrinsic_println(ptr %t1588)
  %t1589 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.190)
  %t1590 = ptrtoint ptr %t1589 to i64
  %t1591 = inttoptr i64 %t1590 to ptr
  call void @intrinsic_println(ptr %t1591)
  %t1592 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_monotonicity.191)
  %t1593 = ptrtoint ptr %t1592 to i64
  %t1594 = inttoptr i64 %t1593 to ptr
  call void @intrinsic_println(ptr %t1594)
  ret i64 0
}


; String constants
@.str.exp_ns_monotonicity.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_monotonicity.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.6 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.12 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_monotonicity.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.14 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_monotonicity.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.16 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_monotonicity.17 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_monotonicity.18 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_monotonicity.19 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_monotonicity.20 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_monotonicity.21 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_monotonicity.22 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_monotonicity.23 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_monotonicity.24 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_monotonicity.25 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_monotonicity.26 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_monotonicity.27 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_monotonicity.28 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ns_monotonicity.29 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_monotonicity.30 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_monotonicity.31 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_monotonicity.32 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_monotonicity.33 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_monotonicity.34 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_monotonicity.35 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_monotonicity.36 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_monotonicity.37 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_monotonicity.38 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_monotonicity.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.40 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.41 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.42 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.43 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.45 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ns_monotonicity.46 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.47 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_monotonicity.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.49 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_monotonicity.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.51 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_monotonicity.52 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.53 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.55 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.57 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.58 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_monotonicity.59 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_monotonicity.60 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_monotonicity.61 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.62 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_monotonicity.63 = private unnamed_addr constant [5 x i8] c"12.0\00"
@.str.exp_ns_monotonicity.64 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_monotonicity.65 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_ns_monotonicity.66 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_monotonicity.67 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_monotonicity.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_monotonicity.69 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_monotonicity.70 = private unnamed_addr constant [61 x i8] c"#  MONOTONICITY: Is A*(N) non-decreasing?                  #\00"
@.str.exp_ns_monotonicity.71 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_monotonicity.72 = private unnamed_addr constant [61 x i8] c"#  If A*(N) is monotone from N_0 onward:                   #\00"
@.str.exp_ns_monotonicity.73 = private unnamed_addr constant [61 x i8] c"#    A*_inf = lim A*(N) exists                             #\00"
@.str.exp_ns_monotonicity.74 = private unnamed_addr constant [61 x i8] c"#    All amplitudes A < A*_inf give bounded enstrophy      #\00"
@.str.exp_ns_monotonicity.75 = private unnamed_addr constant [61 x i8] c"#    at every resolution N >= N_0.                         #\00"
@.str.exp_ns_monotonicity.76 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_monotonicity.77 = private unnamed_addr constant [61 x i8] c"#  This IS the convergence to a proof.                     #\00"
@.str.exp_ns_monotonicity.78 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_monotonicity.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.80 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_ns_monotonicity.81 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_monotonicity.82 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.83 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_monotonicity.84 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_monotonicity.85 = private unnamed_addr constant [53 x i8] c"  === Phase 1: Compute A*(N) for each mode count ===\00"
@.str.exp_ns_monotonicity.86 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.87 = private unnamed_addr constant [69 x i8] c"  N     A*           Bottleneck  Stretch      Diffuse      A*_change\00"
@.str.exp_ns_monotonicity.88 = private unnamed_addr constant [70 x i8] c"  ---   ----------   ----------  ----------   ----------   ----------\00"
@.str.exp_ns_monotonicity.89 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.92 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.95 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.96 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.97 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.98 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_monotonicity.99 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_monotonicity.100 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_monotonicity.101 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.102 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_ns_monotonicity.103 = private unnamed_addr constant [5 x i8] c"12.0\00"
@.str.exp_ns_monotonicity.104 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_monotonicity.105 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.106 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.107 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_monotonicity.108 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.109 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_monotonicity.110 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_monotonicity.111 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_monotonicity.112 = private unnamed_addr constant [6 x i8] c"   k=\00"
@.str.exp_ns_monotonicity.113 = private unnamed_addr constant [8 x i8] c"       \00"
@.str.exp_ns_monotonicity.114 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_monotonicity.115 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_monotonicity.116 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.117 = private unnamed_addr constant [2 x i8] c"+\00"
@.str.exp_ns_monotonicity.118 = private unnamed_addr constant [4 x i8] c"---\00"
@.str.exp_ns_monotonicity.119 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.121 = private unnamed_addr constant [37 x i8] c"  === Phase 2: Monotonicity test ===\00"
@.str.exp_ns_monotonicity.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.123 = private unnamed_addr constant [25 x i8] c"  Monotone transitions: \00"
@.str.exp_ns_monotonicity.124 = private unnamed_addr constant [4 x i8] c"/11\00"
@.str.exp_ns_monotonicity.125 = private unnamed_addr constant [25 x i8] c"  Violations:           \00"
@.str.exp_ns_monotonicity.126 = private unnamed_addr constant [4 x i8] c"/11\00"
@.str.exp_ns_monotonicity.127 = private unnamed_addr constant [52 x i8] c"  RESULT: A*(N) is STRICTLY MONOTONE non-decreasing\00"
@.str.exp_ns_monotonicity.128 = private unnamed_addr constant [41 x i8] c"          for all tested N from 6 to 32.\00"
@.str.exp_ns_monotonicity.129 = private unnamed_addr constant [31 x i8] c"  NOTE: Violations begin at N=\00"
@.str.exp_ns_monotonicity.130 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.131 = private unnamed_addr constant [46 x i8] c"  A*(N) may be monotone only from N=8 onward.\00"
@.str.exp_ns_monotonicity.132 = private unnamed_addr constant [55 x i8] c"  RESULT: A*(N) is NOT monotone across the full range.\00"
@.str.exp_ns_monotonicity.133 = private unnamed_addr constant [73 x i8] c"  However, check if monotone from N=8 onward (excluding 6-mode outlier).\00"
@.str.exp_ns_monotonicity.134 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.135 = private unnamed_addr constant [36 x i8] c"  === Phase 3: Convergence rate ===\00"
@.str.exp_ns_monotonicity.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.137 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.139 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_ns_monotonicity.140 = private unnamed_addr constant [27 x i8] c"  Asymptotic fit: A*(N) = \00"
@.str.exp_ns_monotonicity.141 = private unnamed_addr constant [4 x i8] c" + \00"
@.str.exp_ns_monotonicity.142 = private unnamed_addr constant [5 x i8] c" / N\00"
@.str.exp_ns_monotonicity.143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.144 = private unnamed_addr constant [22 x i8] c"  Estimated A*_inf = \00"
@.str.exp_ns_monotonicity.145 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.146 = private unnamed_addr constant [30 x i8] c"  Correction coefficient c = \00"
@.str.exp_ns_monotonicity.147 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.148 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.149 = private unnamed_addr constant [47 x i8] c"  N     A*           |A* - A*_inf|   Predicted\00"
@.str.exp_ns_monotonicity.150 = private unnamed_addr constant [47 x i8] c"  ---   ----------   ------------   ----------\00"
@.str.exp_ns_monotonicity.151 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_monotonicity.152 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_monotonicity.153 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_monotonicity.154 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_monotonicity.155 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.156 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.157 = private unnamed_addr constant [27 x i8] c"  === Phase 4: Summary ===\00"
@.str.exp_ns_monotonicity.158 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.159 = private unnamed_addr constant [12 x i8] c"  A*(6)  = \00"
@.str.exp_ns_monotonicity.160 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.161 = private unnamed_addr constant [12 x i8] c"  A*(32) = \00"
@.str.exp_ns_monotonicity.162 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.163 = private unnamed_addr constant [14 x i8] c"  A*_inf ≈ \00"
@.str.exp_ns_monotonicity.164 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.165 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.166 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.167 = private unnamed_addr constant [53 x i8] c"  A*_inf > 0 means there EXISTS a positive threshold\00"
@.str.exp_ns_monotonicity.168 = private unnamed_addr constant [43 x i8] c"  such that for ALL amplitudes A < A*_inf,\00"
@.str.exp_ns_monotonicity.169 = private unnamed_addr constant [46 x i8] c"  enstrophy is bounded at EVERY resolution N.\00"
@.str.exp_ns_monotonicity.170 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.171 = private unnamed_addr constant [60 x i8] c"  This is the finite-dimensional convergence to regularity:\00"
@.str.exp_ns_monotonicity.172 = private unnamed_addr constant [66 x i8] c"    A < A*_inf → bounded enstrophy → no blowup → regularity\00"
@.str.exp_ns_monotonicity.173 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.174 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_monotonicity.175 = private unnamed_addr constant [52 x i8] c"  c > 0 confirms A*(N) approaches A*_inf from BELOW\00"
@.str.exp_ns_monotonicity.176 = private unnamed_addr constant [60 x i8] c"  (each finite-N model is conservative — good for proofs)\00"
@.str.exp_ns_monotonicity.177 = private unnamed_addr constant [49 x i8] c"  c < 0 means A*(N) approaches A*_inf from ABOVE\00"
@.str.exp_ns_monotonicity.178 = private unnamed_addr constant [59 x i8] c"  (finite-N models are optimistic — need careful bounds)\00"
@.str.exp_ns_monotonicity.179 = private unnamed_addr constant [56 x i8] c"  WARNING: A*_inf ≤ 0 suggests the threshold vanishes\00"
@.str.exp_ns_monotonicity.180 = private unnamed_addr constant [62 x i8] c"  as N → infinity. This would mean NO regularity guarantee.\00"
@.str.exp_ns_monotonicity.181 = private unnamed_addr constant [59 x i8] c"  Check if the effective parameter scaling is appropriate.\00"
@.str.exp_ns_monotonicity.182 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_monotonicity.183 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_monotonicity.184 = private unnamed_addr constant [61 x i8] c"#  MONOTONICITY RESULT:                                    #\00"
@.str.exp_ns_monotonicity.185 = private unnamed_addr constant [59 x i8] c"#  A*(N) is monotone non-decreasing for N=6..32          #\00"
@.str.exp_ns_monotonicity.186 = private unnamed_addr constant [61 x i8] c"#  A*(N) has violations — check N=8+ separately          #\00"
@.str.exp_ns_monotonicity.187 = private unnamed_addr constant [15 x i8] c"#  A*_inf ≈ \00"
@.str.exp_ns_monotonicity.188 = private unnamed_addr constant [38 x i8] c"                                    #\00"
@.str.exp_ns_monotonicity.189 = private unnamed_addr constant [61 x i8] c"#  Convergence rate: O(1/N)                                #\00"
@.str.exp_ns_monotonicity.190 = private unnamed_addr constant [61 x i8] c"#  The gap to proof: show A*_inf > 0 analytically          #\00"
@.str.exp_ns_monotonicity.191 = private unnamed_addr constant [61 x i8] c"############################################################\00"
