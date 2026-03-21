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
  %t1 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"dot_n"(i64 %a, i64 %b, i64 %n) nounwind {
entry:
  %local.sum.9 = alloca i64
  %local.i.10 = alloca i64
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t11 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.2)
  store i64 %t11, ptr %local.sum.9
  store i64 0, ptr %local.i.10
  br label %loop1
loop1:
  %t12 = load i64, ptr %local.i.10
  %t13 = load i64, ptr %local.n
  %t14 = icmp slt i64 %t12, %t13
  %t15 = zext i1 %t14 to i64
  %t16 = icmp ne i64 %t15, 0
  br i1 %t16, label %body1, label %endloop1
body1:
  %t17 = load i64, ptr %local.sum.9
  %t18 = load i64, ptr %local.a
  %t19 = load i64, ptr %local.i.10
  %t20 = inttoptr i64 %t18 to ptr
  %t21 = call ptr @intrinsic_vec_get(ptr %t20, i64 %t19)
  %t22 = ptrtoint ptr %t21 to i64
  %t23 = call i64 @"bits_to_f64"(i64 %t22)
  %t24 = load i64, ptr %local.b
  %t25 = load i64, ptr %local.i.10
  %t26 = inttoptr i64 %t24 to ptr
  %t27 = call ptr @intrinsic_vec_get(ptr %t26, i64 %t25)
  %t28 = ptrtoint ptr %t27 to i64
  %t29 = call i64 @"bits_to_f64"(i64 %t28)
  %t30 = mul i64 %t23, %t29
  %t31 = call i64 @"sx_f64_add"(i64 %t17, i64 %t30)
  store i64 %t31, ptr %local.sum.9
  %t32 = load i64, ptr %local.i.10
  %t33 = add i64 %t32, 1
  store i64 %t33, ptr %local.i.10
  br label %loop1
endloop1:
  %t34 = load i64, ptr %local.sum.9
  ret i64 %t34
}

define i64 @"norm_n"(i64 %a, i64 %n) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t35 = load i64, ptr %local.a
  %t36 = load i64, ptr %local.a
  %t37 = load i64, ptr %local.n
  %t38 = call i64 @"dot_n"(i64 %t35, i64 %t36, i64 %t37)
  %t39 = call i64 @"sqrt_f64"(i64 %t38)
  ret i64 %t39
}

define i64 @"cosine_n"(i64 %a, i64 %b, i64 %n) nounwind {
entry:
  %local.d.40 = alloca i64
  %local.na.41 = alloca i64
  %local.nb.42 = alloca i64
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t43 = load i64, ptr %local.a
  %t44 = load i64, ptr %local.b
  %t45 = load i64, ptr %local.n
  %t46 = call i64 @"dot_n"(i64 %t43, i64 %t44, i64 %t45)
  store i64 %t46, ptr %local.d.40
  %t47 = load i64, ptr %local.a
  %t48 = load i64, ptr %local.n
  %t49 = call i64 @"norm_n"(i64 %t47, i64 %t48)
  store i64 %t49, ptr %local.na.41
  %t50 = load i64, ptr %local.b
  %t51 = load i64, ptr %local.n
  %t52 = call i64 @"norm_n"(i64 %t50, i64 %t51)
  store i64 %t52, ptr %local.nb.42
  %t53 = load i64, ptr %local.d.40
  %t54 = load i64, ptr %local.na.41
  %t55 = load i64, ptr %local.nb.42
  %t56 = call i64 @"sx_f64_mul"(i64 %t54, i64 %t55)
  %t57 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.3)
  %t58 = call i64 @"sx_f64_add"(i64 %t56, i64 %t57)
  %t59 = call i64 @"sx_f64_div"(i64 %t53, i64 %t58)
  ret i64 %t59
}

define i64 @"vec_fill"(i64 %n, i64 %val) nounwind {
entry:
  %local.v.60 = alloca i64
  %local.i.61 = alloca i64
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.val = alloca i64
  store i64 %val, ptr %local.val
  %t62 = call ptr @intrinsic_vec_new()
  %t63 = ptrtoint ptr %t62 to i64
  store i64 %t63, ptr %local.v.60
  store i64 0, ptr %local.i.61
  br label %loop2
loop2:
  %t64 = load i64, ptr %local.i.61
  %t65 = load i64, ptr %local.n
  %t66 = icmp slt i64 %t64, %t65
  %t67 = zext i1 %t66 to i64
  %t68 = icmp ne i64 %t67, 0
  br i1 %t68, label %body2, label %endloop2
body2:
  %t69 = load i64, ptr %local.v.60
  %t70 = load i64, ptr %local.val
  %t71 = call i64 @"f64_to_bits"(i64 %t70)
  %t72 = inttoptr i64 %t69 to ptr
  %t73 = inttoptr i64 %t71 to ptr
  call void @intrinsic_vec_push(ptr %t72, ptr %t73)
  %t74 = load i64, ptr %local.i.61
  %t75 = add i64 %t74, 1
  store i64 %t75, ptr %local.i.61
  br label %loop2
endloop2:
  %t76 = load i64, ptr %local.v.60
  ret i64 %t76
}

define i64 @"vset"(i64 %v, i64 %i, i64 %val) nounwind {
entry:
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %local.val = alloca i64
  store i64 %val, ptr %local.val
  %t77 = load i64, ptr %local.v
  %t78 = load i64, ptr %local.i
  %t79 = load i64, ptr %local.val
  %t80 = call i64 @"f64_to_bits"(i64 %t79)
  %t81 = inttoptr i64 %t77 to ptr
  %t82 = inttoptr i64 %t80 to ptr
  call void @intrinsic_vec_set(ptr %t81, i64 %t78, ptr %t82)
  ret i64 0
}

define i64 @"vget"(i64 %v, i64 %i) nounwind {
entry:
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %t83 = load i64, ptr %local.v
  %t84 = load i64, ptr %local.i
  %t85 = inttoptr i64 %t83 to ptr
  %t86 = call ptr @intrinsic_vec_get(ptr %t85, i64 %t84)
  %t87 = ptrtoint ptr %t86 to i64
  %t88 = call i64 @"bits_to_f64"(i64 %t87)
  ret i64 %t88
}

define i64 @"project_grad"(i64 %gi, i64 %gj, i64 %alpha, i64 %n) nounwind {
entry:
  %local.cv.89 = alloca i64
  %local.r.90 = alloca i64
  %local.k.91 = alloca i64
  %local.scale.92 = alloca i64
  %local.gsq.93 = alloca i64
  %local.coeff.94 = alloca i64
  %local.r.95 = alloca i64
  %local.k.96 = alloca i64
  %local.gi = alloca i64
  store i64 %gi, ptr %local.gi
  %local.gj = alloca i64
  store i64 %gj, ptr %local.gj
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t97 = load i64, ptr %local.gi
  %t98 = load i64, ptr %local.gj
  %t99 = load i64, ptr %local.n
  %t100 = call i64 @"cosine_n"(i64 %t97, i64 %t98, i64 %t99)
  store i64 %t100, ptr %local.cv.89
  %t101 = load i64, ptr %local.cv.89
  %t102 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.4)
  %t103 = call i64 @"sx_f64_ge"(i64 %t101, i64 %t102)
  %t104 = icmp ne i64 %t103, 0
  br i1 %t104, label %then3, label %else3
then3:
  %t105 = load i64, ptr %local.n
  %t106 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.5)
  %t107 = call i64 @"vec_fill"(i64 %t105, i64 %t106)
  store i64 %t107, ptr %local.r.90
  store i64 0, ptr %local.k.91
  br label %loop4
loop4:
  %t108 = load i64, ptr %local.k.91
  %t109 = load i64, ptr %local.n
  %t110 = icmp slt i64 %t108, %t109
  %t111 = zext i1 %t110 to i64
  %t112 = icmp ne i64 %t111, 0
  br i1 %t112, label %body4, label %endloop4
body4:
  %t113 = load i64, ptr %local.r.90
  %t114 = load i64, ptr %local.k.91
  %t115 = load i64, ptr %local.gi
  %t116 = load i64, ptr %local.k.91
  %t117 = call i64 @"vget"(i64 %t115, i64 %t116)
  %t118 = call i64 @"vset"(i64 %t113, i64 %t114, i64 %t117)
  %t119 = load i64, ptr %local.k.91
  %t120 = add i64 %t119, 1
  store i64 %t120, ptr %local.k.91
  br label %loop4
endloop4:
  %t121 = load i64, ptr %local.r.90
  ret i64 %t121
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t122 = phi i64 [ 0, %else3_end ]
  %t123 = load i64, ptr %local.alpha
  %t124 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.6)
  %t125 = load i64, ptr %local.cv.89
  %t126 = call i64 @"sx_f64_sub"(i64 %t124, i64 %t125)
  %t127 = call i64 @"sx_f64_mul"(i64 %t123, i64 %t126)
  store i64 %t127, ptr %local.scale.92
  %t128 = load i64, ptr %local.gj
  %t129 = load i64, ptr %local.gj
  %t130 = load i64, ptr %local.n
  %t131 = call i64 @"dot_n"(i64 %t128, i64 %t129, i64 %t130)
  %t132 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.7)
  %t133 = call i64 @"sx_f64_add"(i64 %t131, i64 %t132)
  store i64 %t133, ptr %local.gsq.93
  %t134 = load i64, ptr %local.scale.92
  %t135 = load i64, ptr %local.gi
  %t136 = load i64, ptr %local.gj
  %t137 = load i64, ptr %local.n
  %t138 = call i64 @"dot_n"(i64 %t135, i64 %t136, i64 %t137)
  %t139 = call i64 @"sx_f64_mul"(i64 %t134, i64 %t138)
  %t140 = load i64, ptr %local.gsq.93
  %t141 = call i64 @"sx_f64_div"(i64 %t139, i64 %t140)
  store i64 %t141, ptr %local.coeff.94
  %t142 = load i64, ptr %local.n
  %t143 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.8)
  %t144 = call i64 @"vec_fill"(i64 %t142, i64 %t143)
  store i64 %t144, ptr %local.r.95
  store i64 0, ptr %local.k.96
  br label %loop5
loop5:
  %t145 = load i64, ptr %local.k.96
  %t146 = load i64, ptr %local.n
  %t147 = icmp slt i64 %t145, %t146
  %t148 = zext i1 %t147 to i64
  %t149 = icmp ne i64 %t148, 0
  br i1 %t149, label %body5, label %endloop5
body5:
  %t150 = load i64, ptr %local.r.95
  %t151 = load i64, ptr %local.k.96
  %t152 = load i64, ptr %local.gi
  %t153 = load i64, ptr %local.k.96
  %t154 = call i64 @"vget"(i64 %t152, i64 %t153)
  %t155 = load i64, ptr %local.coeff.94
  %t156 = load i64, ptr %local.gj
  %t157 = load i64, ptr %local.k.96
  %t158 = call i64 @"vget"(i64 %t156, i64 %t157)
  %t159 = call i64 @"sx_f64_mul"(i64 %t155, i64 %t158)
  %t160 = call i64 @"sx_f64_sub"(i64 %t154, i64 %t159)
  %t161 = call i64 @"vset"(i64 %t150, i64 %t151, i64 %t160)
  %t162 = load i64, ptr %local.k.96
  %t163 = add i64 %t162, 1
  store i64 %t163, ptr %local.k.96
  br label %loop5
endloop5:
  %t164 = load i64, ptr %local.r.95
  ret i64 %t164
}

define i64 @"grad_toward"(i64 %w, i64 %target, i64 %weight, i64 %n) nounwind {
entry:
  %local.g.165 = alloca i64
  %local.i.166 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.target = alloca i64
  store i64 %target, ptr %local.target
  %local.weight = alloca i64
  store i64 %weight, ptr %local.weight
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t167 = load i64, ptr %local.n
  %t168 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.9)
  %t169 = call i64 @"vec_fill"(i64 %t167, i64 %t168)
  store i64 %t169, ptr %local.g.165
  store i64 0, ptr %local.i.166
  br label %loop6
loop6:
  %t170 = load i64, ptr %local.i.166
  %t171 = load i64, ptr %local.n
  %t172 = icmp slt i64 %t170, %t171
  %t173 = zext i1 %t172 to i64
  %t174 = icmp ne i64 %t173, 0
  br i1 %t174, label %body6, label %endloop6
body6:
  %t175 = load i64, ptr %local.g.165
  %t176 = load i64, ptr %local.i.166
  %t177 = load i64, ptr %local.weight
  %t178 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.10)
  %t179 = call i64 @"sx_f64_mul"(i64 %t177, i64 %t178)
  %t180 = load i64, ptr %local.w
  %t181 = load i64, ptr %local.i.166
  %t182 = call i64 @"vget"(i64 %t180, i64 %t181)
  %t183 = load i64, ptr %local.target
  %t184 = load i64, ptr %local.i.166
  %t185 = call i64 @"vget"(i64 %t183, i64 %t184)
  %t186 = sub i64 %t182, %t185
  %t187 = call i64 @"sx_f64_mul"(i64 %t179, i64 %t186)
  %t188 = call i64 @"vset"(i64 %t175, i64 %t176, i64 %t187)
  %t189 = load i64, ptr %local.i.166
  %t190 = add i64 %t189, 1
  store i64 %t190, ptr %local.i.166
  br label %loop6
endloop6:
  %t191 = load i64, ptr %local.g.165
  ret i64 %t191
}

define i64 @"loss_toward"(i64 %w, i64 %target, i64 %weight, i64 %n) nounwind {
entry:
  %local.sum.192 = alloca i64
  %local.i.193 = alloca i64
  %local.d.194 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.target = alloca i64
  store i64 %target, ptr %local.target
  %local.weight = alloca i64
  store i64 %weight, ptr %local.weight
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t195 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.11)
  store i64 %t195, ptr %local.sum.192
  store i64 0, ptr %local.i.193
  br label %loop7
loop7:
  %t196 = load i64, ptr %local.i.193
  %t197 = load i64, ptr %local.n
  %t198 = icmp slt i64 %t196, %t197
  %t199 = zext i1 %t198 to i64
  %t200 = icmp ne i64 %t199, 0
  br i1 %t200, label %body7, label %endloop7
body7:
  %t201 = load i64, ptr %local.w
  %t202 = load i64, ptr %local.i.193
  %t203 = call i64 @"vget"(i64 %t201, i64 %t202)
  %t204 = load i64, ptr %local.target
  %t205 = load i64, ptr %local.i.193
  %t206 = call i64 @"vget"(i64 %t204, i64 %t205)
  %t207 = sub i64 %t203, %t206
  store i64 %t207, ptr %local.d.194
  %t208 = load i64, ptr %local.sum.192
  %t209 = load i64, ptr %local.weight
  %t210 = load i64, ptr %local.d.194
  %t211 = call i64 @"sx_f64_mul"(i64 %t209, i64 %t210)
  %t212 = load i64, ptr %local.d.194
  %t213 = call i64 @"sx_f64_mul"(i64 %t211, i64 %t212)
  %t214 = call i64 @"sx_f64_add"(i64 %t208, i64 %t213)
  store i64 %t214, ptr %local.sum.192
  %t215 = load i64, ptr %local.i.193
  %t216 = add i64 %t215, 1
  store i64 %t216, ptr %local.i.193
  br label %loop7
endloop7:
  %t217 = load i64, ptr %local.sum.192
  ret i64 %t217
}

define i64 @"ackley"(i64 %w, i64 %n) nounwind {
entry:
  %local.pi.218 = alloca i64
  %local.e_const.219 = alloca i64
  %local.nf.220 = alloca i64
  %local.sum_sq.221 = alloca i64
  %local.sum_cos.222 = alloca i64
  %local.i.223 = alloca i64
  %local.xi.224 = alloca i64
  %local.t1.225 = alloca i64
  %local.t2.226 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t227 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.12)
  store i64 %t227, ptr %local.pi.218
  %t228 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.13)
  store i64 %t228, ptr %local.e_const.219
  %t229 = load i64, ptr %local.n
  %t230 = call i64 @"sx_int_to_f64"(i64 %t229)
  store i64 %t230, ptr %local.nf.220
  %t231 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.14)
  store i64 %t231, ptr %local.sum_sq.221
  %t232 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.15)
  store i64 %t232, ptr %local.sum_cos.222
  store i64 0, ptr %local.i.223
  br label %loop8
loop8:
  %t233 = load i64, ptr %local.i.223
  %t234 = load i64, ptr %local.n
  %t235 = icmp slt i64 %t233, %t234
  %t236 = zext i1 %t235 to i64
  %t237 = icmp ne i64 %t236, 0
  br i1 %t237, label %body8, label %endloop8
body8:
  %t238 = load i64, ptr %local.w
  %t239 = load i64, ptr %local.i.223
  %t240 = call i64 @"vget"(i64 %t238, i64 %t239)
  store i64 %t240, ptr %local.xi.224
  %t241 = load i64, ptr %local.sum_sq.221
  %t242 = load i64, ptr %local.xi.224
  %t243 = load i64, ptr %local.xi.224
  %t244 = call i64 @"sx_f64_mul"(i64 %t242, i64 %t243)
  %t245 = call i64 @"sx_f64_add"(i64 %t241, i64 %t244)
  store i64 %t245, ptr %local.sum_sq.221
  %t246 = load i64, ptr %local.sum_cos.222
  %t247 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.16)
  %t248 = load i64, ptr %local.pi.218
  %t249 = call i64 @"sx_f64_mul"(i64 %t247, i64 %t248)
  %t250 = load i64, ptr %local.xi.224
  %t251 = call i64 @"sx_f64_mul"(i64 %t249, i64 %t250)
  %t252 = call i64 @"cos_f64"(i64 %t251)
  %t253 = call i64 @"sx_f64_add"(i64 %t246, i64 %t252)
  store i64 %t253, ptr %local.sum_cos.222
  %t254 = load i64, ptr %local.i.223
  %t255 = add i64 %t254, 1
  store i64 %t255, ptr %local.i.223
  br label %loop8
endloop8:
  %t256 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.17)
  %t257 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.18)
  %t258 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.19)
  %t259 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.20)
  %t260 = load i64, ptr %local.sum_sq.221
  %t261 = load i64, ptr %local.nf.220
  %t262 = call i64 @"sx_f64_div"(i64 %t260, i64 %t261)
  %t263 = call i64 @"sqrt_f64"(i64 %t262)
  %t264 = call i64 @"sx_f64_mul"(i64 %t259, i64 %t263)
  %t265 = call i64 @"sx_f64_sub"(i64 %t258, i64 %t264)
  %t266 = call i64 @"exp_f64"(i64 %t265)
  %t267 = call i64 @"sx_f64_mul"(i64 %t257, i64 %t266)
  %t268 = call i64 @"sx_f64_sub"(i64 %t256, i64 %t267)
  store i64 %t268, ptr %local.t1.225
  %t269 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.21)
  %t270 = load i64, ptr %local.sum_cos.222
  %t271 = load i64, ptr %local.nf.220
  %t272 = call i64 @"sx_f64_div"(i64 %t270, i64 %t271)
  %t273 = call i64 @"exp_f64"(i64 %t272)
  %t274 = call i64 @"sx_f64_sub"(i64 %t269, i64 %t273)
  store i64 %t274, ptr %local.t2.226
  %t275 = load i64, ptr %local.t1.225
  %t276 = load i64, ptr %local.t2.226
  %t277 = call i64 @"sx_f64_add"(i64 %t275, i64 %t276)
  %t278 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.22)
  %t279 = call i64 @"sx_f64_add"(i64 %t277, i64 %t278)
  %t280 = load i64, ptr %local.e_const.219
  %t281 = call i64 @"sx_f64_add"(i64 %t279, i64 %t280)
  ret i64 %t281
}

define i64 @"ackley_grad_d"(i64 %w, i64 %n, i64 %d) nounwind {
entry:
  %local.h.282 = alloca i64
  %local.orig.283 = alloca i64
  %local.fp.284 = alloca i64
  %local.fm.285 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.d = alloca i64
  store i64 %d, ptr %local.d
  %t286 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.23)
  store i64 %t286, ptr %local.h.282
  %t287 = load i64, ptr %local.w
  %t288 = load i64, ptr %local.d
  %t289 = call i64 @"vget"(i64 %t287, i64 %t288)
  store i64 %t289, ptr %local.orig.283
  %t290 = load i64, ptr %local.w
  %t291 = load i64, ptr %local.d
  %t292 = load i64, ptr %local.orig.283
  %t293 = load i64, ptr %local.h.282
  %t294 = call i64 @"sx_f64_add"(i64 %t292, i64 %t293)
  %t295 = call i64 @"vset"(i64 %t290, i64 %t291, i64 %t294)
  %t296 = load i64, ptr %local.w
  %t297 = load i64, ptr %local.n
  %t298 = call i64 @"ackley"(i64 %t296, i64 %t297)
  store i64 %t298, ptr %local.fp.284
  %t299 = load i64, ptr %local.w
  %t300 = load i64, ptr %local.d
  %t301 = load i64, ptr %local.orig.283
  %t302 = load i64, ptr %local.h.282
  %t303 = call i64 @"sx_f64_sub"(i64 %t301, i64 %t302)
  %t304 = call i64 @"vset"(i64 %t299, i64 %t300, i64 %t303)
  %t305 = load i64, ptr %local.w
  %t306 = load i64, ptr %local.n
  %t307 = call i64 @"ackley"(i64 %t305, i64 %t306)
  store i64 %t307, ptr %local.fm.285
  %t308 = load i64, ptr %local.w
  %t309 = load i64, ptr %local.d
  %t310 = load i64, ptr %local.orig.283
  %t311 = call i64 @"vset"(i64 %t308, i64 %t309, i64 %t310)
  %t312 = load i64, ptr %local.fp.284
  %t313 = load i64, ptr %local.fm.285
  %t314 = call i64 @"sx_f64_sub"(i64 %t312, i64 %t313)
  %t315 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.24)
  %t316 = load i64, ptr %local.h.282
  %t317 = call i64 @"sx_f64_mul"(i64 %t315, i64 %t316)
  %t318 = call i64 @"sx_f64_div"(i64 %t314, i64 %t317)
  ret i64 %t318
}

define i64 @"ackley_grad"(i64 %w, i64 %n) nounwind {
entry:
  %local.g.319 = alloca i64
  %local.i.320 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t321 = load i64, ptr %local.n
  %t322 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.25)
  %t323 = call i64 @"vec_fill"(i64 %t321, i64 %t322)
  store i64 %t323, ptr %local.g.319
  store i64 0, ptr %local.i.320
  br label %loop9
loop9:
  %t324 = load i64, ptr %local.i.320
  %t325 = load i64, ptr %local.n
  %t326 = icmp slt i64 %t324, %t325
  %t327 = zext i1 %t326 to i64
  %t328 = icmp ne i64 %t327, 0
  br i1 %t328, label %body9, label %endloop9
body9:
  %t329 = load i64, ptr %local.g.319
  %t330 = load i64, ptr %local.i.320
  %t331 = load i64, ptr %local.w
  %t332 = load i64, ptr %local.n
  %t333 = load i64, ptr %local.i.320
  %t334 = call i64 @"ackley_grad_d"(i64 %t331, i64 %t332, i64 %t333)
  %t335 = call i64 @"vset"(i64 %t329, i64 %t330, i64 %t334)
  %t336 = load i64, ptr %local.i.320
  %t337 = add i64 %t336, 1
  store i64 %t337, ptr %local.i.320
  br label %loop9
endloop9:
  %t338 = load i64, ptr %local.g.319
  ret i64 %t338
}

define i64 @"shifted_ackley"(i64 %w, i64 %target, i64 %n) nounwind {
entry:
  %local.s.339 = alloca i64
  %local.i.340 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.target = alloca i64
  store i64 %target, ptr %local.target
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t341 = load i64, ptr %local.n
  %t342 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.26)
  %t343 = call i64 @"vec_fill"(i64 %t341, i64 %t342)
  store i64 %t343, ptr %local.s.339
  store i64 0, ptr %local.i.340
  br label %loop10
loop10:
  %t344 = load i64, ptr %local.i.340
  %t345 = load i64, ptr %local.n
  %t346 = icmp slt i64 %t344, %t345
  %t347 = zext i1 %t346 to i64
  %t348 = icmp ne i64 %t347, 0
  br i1 %t348, label %body10, label %endloop10
body10:
  %t349 = load i64, ptr %local.s.339
  %t350 = load i64, ptr %local.i.340
  %t351 = load i64, ptr %local.w
  %t352 = load i64, ptr %local.i.340
  %t353 = call i64 @"vget"(i64 %t351, i64 %t352)
  %t354 = load i64, ptr %local.target
  %t355 = load i64, ptr %local.i.340
  %t356 = call i64 @"vget"(i64 %t354, i64 %t355)
  %t357 = sub i64 %t353, %t356
  %t358 = call i64 @"vset"(i64 %t349, i64 %t350, i64 %t357)
  %t359 = load i64, ptr %local.i.340
  %t360 = add i64 %t359, 1
  store i64 %t360, ptr %local.i.340
  br label %loop10
endloop10:
  %t361 = load i64, ptr %local.s.339
  %t362 = load i64, ptr %local.n
  %t363 = call i64 @"ackley"(i64 %t361, i64 %t362)
  ret i64 %t363
}

define i64 @"shifted_ackley_grad"(i64 %w, i64 %target, i64 %n) nounwind {
entry:
  %local.s.364 = alloca i64
  %local.i.365 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.target = alloca i64
  store i64 %target, ptr %local.target
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t366 = load i64, ptr %local.n
  %t367 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.27)
  %t368 = call i64 @"vec_fill"(i64 %t366, i64 %t367)
  store i64 %t368, ptr %local.s.364
  store i64 0, ptr %local.i.365
  br label %loop11
loop11:
  %t369 = load i64, ptr %local.i.365
  %t370 = load i64, ptr %local.n
  %t371 = icmp slt i64 %t369, %t370
  %t372 = zext i1 %t371 to i64
  %t373 = icmp ne i64 %t372, 0
  br i1 %t373, label %body11, label %endloop11
body11:
  %t374 = load i64, ptr %local.s.364
  %t375 = load i64, ptr %local.i.365
  %t376 = load i64, ptr %local.w
  %t377 = load i64, ptr %local.i.365
  %t378 = call i64 @"vget"(i64 %t376, i64 %t377)
  %t379 = load i64, ptr %local.target
  %t380 = load i64, ptr %local.i.365
  %t381 = call i64 @"vget"(i64 %t379, i64 %t380)
  %t382 = sub i64 %t378, %t381
  %t383 = call i64 @"vset"(i64 %t374, i64 %t375, i64 %t382)
  %t384 = load i64, ptr %local.i.365
  %t385 = add i64 %t384, 1
  store i64 %t385, ptr %local.i.365
  br label %loop11
endloop11:
  %t386 = load i64, ptr %local.s.364
  %t387 = load i64, ptr %local.n
  %t388 = call i64 @"ackley_grad"(i64 %t386, i64 %t387)
  ret i64 %t388
}

define i64 @"clip_grad"(i64 %g, i64 %n, i64 %max_n) nounwind {
entry:
  %local.gn.389 = alloca i64
  %local.sc.390 = alloca i64
  %local.r.391 = alloca i64
  %local.i.392 = alloca i64
  %local.g = alloca i64
  store i64 %g, ptr %local.g
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.max_n = alloca i64
  store i64 %max_n, ptr %local.max_n
  %t393 = load i64, ptr %local.g
  %t394 = load i64, ptr %local.n
  %t395 = call i64 @"norm_n"(i64 %t393, i64 %t394)
  store i64 %t395, ptr %local.gn.389
  %t396 = load i64, ptr %local.gn.389
  %t397 = load i64, ptr %local.max_n
  %t398 = call i64 @"sx_f64_le"(i64 %t396, i64 %t397)
  %t399 = icmp ne i64 %t398, 0
  br i1 %t399, label %then12, label %else12
then12:
  %t400 = load i64, ptr %local.g
  ret i64 %t400
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t401 = phi i64 [ 0, %else12_end ]
  %t402 = load i64, ptr %local.max_n
  %t403 = load i64, ptr %local.gn.389
  %t404 = call i64 @"sx_f64_div"(i64 %t402, i64 %t403)
  store i64 %t404, ptr %local.sc.390
  %t405 = load i64, ptr %local.n
  %t406 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.28)
  %t407 = call i64 @"vec_fill"(i64 %t405, i64 %t406)
  store i64 %t407, ptr %local.r.391
  store i64 0, ptr %local.i.392
  br label %loop13
loop13:
  %t408 = load i64, ptr %local.i.392
  %t409 = load i64, ptr %local.n
  %t410 = icmp slt i64 %t408, %t409
  %t411 = zext i1 %t410 to i64
  %t412 = icmp ne i64 %t411, 0
  br i1 %t412, label %body13, label %endloop13
body13:
  %t413 = load i64, ptr %local.r.391
  %t414 = load i64, ptr %local.i.392
  %t415 = load i64, ptr %local.g
  %t416 = load i64, ptr %local.i.392
  %t417 = call i64 @"vget"(i64 %t415, i64 %t416)
  %t418 = load i64, ptr %local.sc.390
  %t419 = call i64 @"sx_f64_mul"(i64 %t417, i64 %t418)
  %t420 = call i64 @"vset"(i64 %t413, i64 %t414, i64 %t419)
  %t421 = load i64, ptr %local.i.392
  %t422 = add i64 %t421, 1
  store i64 %t422, ptr %local.i.392
  br label %loop13
endloop13:
  %t423 = load i64, ptr %local.r.391
  ret i64 %t423
}

define i64 @"train_adversarial"(i64 %ta, i64 %tb, i64 %tc, i64 %wa, i64 %wb, i64 %wc, i64 %ab, i64 %ac, i64 %ba, i64 %bc, i64 %ca, i64 %cb, i64 %n, i64 %steps, i64 %lr) nounwind {
entry:
  %local.w.424 = alloca i64
  %local.step.425 = alloca i64
  %local.ga.426 = alloca i64
  %local.gb.427 = alloca i64
  %local.gc.428 = alloca i64
  %local.ra.429 = alloca i64
  %local.rb.430 = alloca i64
  %local.rc.431 = alloca i64
  %local.i.432 = alloca i64
  %local.la.433 = alloca i64
  %local.lb.434 = alloca i64
  %local.lc.435 = alloca i64
  %local.ta = alloca i64
  store i64 %ta, ptr %local.ta
  %local.tb = alloca i64
  store i64 %tb, ptr %local.tb
  %local.tc = alloca i64
  store i64 %tc, ptr %local.tc
  %local.wa = alloca i64
  store i64 %wa, ptr %local.wa
  %local.wb = alloca i64
  store i64 %wb, ptr %local.wb
  %local.wc = alloca i64
  store i64 %wc, ptr %local.wc
  %local.ab = alloca i64
  store i64 %ab, ptr %local.ab
  %local.ac = alloca i64
  store i64 %ac, ptr %local.ac
  %local.ba = alloca i64
  store i64 %ba, ptr %local.ba
  %local.bc = alloca i64
  store i64 %bc, ptr %local.bc
  %local.ca = alloca i64
  store i64 %ca, ptr %local.ca
  %local.cb = alloca i64
  store i64 %cb, ptr %local.cb
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %t436 = load i64, ptr %local.n
  %t437 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.29)
  %t438 = call i64 @"vec_fill"(i64 %t436, i64 %t437)
  store i64 %t438, ptr %local.w.424
  store i64 0, ptr %local.step.425
  br label %loop14
loop14:
  %t439 = load i64, ptr %local.step.425
  %t440 = load i64, ptr %local.steps
  %t441 = icmp slt i64 %t439, %t440
  %t442 = zext i1 %t441 to i64
  %t443 = icmp ne i64 %t442, 0
  br i1 %t443, label %body14, label %endloop14
body14:
  %t444 = load i64, ptr %local.w.424
  %t445 = load i64, ptr %local.ta
  %t446 = load i64, ptr %local.wa
  %t447 = load i64, ptr %local.n
  %t448 = call i64 @"grad_toward"(i64 %t444, i64 %t445, i64 %t446, i64 %t447)
  %t449 = load i64, ptr %local.n
  %t450 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.30)
  %t451 = call i64 @"clip_grad"(i64 %t448, i64 %t449, i64 %t450)
  store i64 %t451, ptr %local.ga.426
  %t452 = load i64, ptr %local.w.424
  %t453 = load i64, ptr %local.tb
  %t454 = load i64, ptr %local.wb
  %t455 = load i64, ptr %local.n
  %t456 = call i64 @"grad_toward"(i64 %t452, i64 %t453, i64 %t454, i64 %t455)
  %t457 = load i64, ptr %local.n
  %t458 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.31)
  %t459 = call i64 @"clip_grad"(i64 %t456, i64 %t457, i64 %t458)
  store i64 %t459, ptr %local.gb.427
  %t460 = load i64, ptr %local.w.424
  %t461 = load i64, ptr %local.tc
  %t462 = load i64, ptr %local.wc
  %t463 = load i64, ptr %local.n
  %t464 = call i64 @"grad_toward"(i64 %t460, i64 %t461, i64 %t462, i64 %t463)
  %t465 = load i64, ptr %local.n
  %t466 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.32)
  %t467 = call i64 @"clip_grad"(i64 %t464, i64 %t465, i64 %t466)
  store i64 %t467, ptr %local.gc.428
  %t468 = load i64, ptr %local.ga.426
  %t469 = load i64, ptr %local.gb.427
  %t470 = load i64, ptr %local.ab
  %t471 = load i64, ptr %local.n
  %t472 = call i64 @"project_grad"(i64 %t468, i64 %t469, i64 %t470, i64 %t471)
  %t473 = load i64, ptr %local.gc.428
  %t474 = load i64, ptr %local.ac
  %t475 = load i64, ptr %local.n
  %t476 = call i64 @"project_grad"(i64 %t472, i64 %t473, i64 %t474, i64 %t475)
  store i64 %t476, ptr %local.ra.429
  %t477 = load i64, ptr %local.gb.427
  %t478 = load i64, ptr %local.ga.426
  %t479 = load i64, ptr %local.ba
  %t480 = load i64, ptr %local.n
  %t481 = call i64 @"project_grad"(i64 %t477, i64 %t478, i64 %t479, i64 %t480)
  %t482 = load i64, ptr %local.gc.428
  %t483 = load i64, ptr %local.bc
  %t484 = load i64, ptr %local.n
  %t485 = call i64 @"project_grad"(i64 %t481, i64 %t482, i64 %t483, i64 %t484)
  store i64 %t485, ptr %local.rb.430
  %t486 = load i64, ptr %local.gc.428
  %t487 = load i64, ptr %local.ga.426
  %t488 = load i64, ptr %local.ca
  %t489 = load i64, ptr %local.n
  %t490 = call i64 @"project_grad"(i64 %t486, i64 %t487, i64 %t488, i64 %t489)
  %t491 = load i64, ptr %local.gb.427
  %t492 = load i64, ptr %local.cb
  %t493 = load i64, ptr %local.n
  %t494 = call i64 @"project_grad"(i64 %t490, i64 %t491, i64 %t492, i64 %t493)
  store i64 %t494, ptr %local.rc.431
  store i64 0, ptr %local.i.432
  br label %loop15
loop15:
  %t495 = load i64, ptr %local.i.432
  %t496 = load i64, ptr %local.n
  %t497 = icmp slt i64 %t495, %t496
  %t498 = zext i1 %t497 to i64
  %t499 = icmp ne i64 %t498, 0
  br i1 %t499, label %body15, label %endloop15
body15:
  %t500 = load i64, ptr %local.w.424
  %t501 = load i64, ptr %local.i.432
  %t502 = load i64, ptr %local.w.424
  %t503 = load i64, ptr %local.i.432
  %t504 = call i64 @"vget"(i64 %t502, i64 %t503)
  %t505 = load i64, ptr %local.lr
  %t506 = load i64, ptr %local.ra.429
  %t507 = load i64, ptr %local.i.432
  %t508 = call i64 @"vget"(i64 %t506, i64 %t507)
  %t509 = load i64, ptr %local.rb.430
  %t510 = load i64, ptr %local.i.432
  %t511 = call i64 @"vget"(i64 %t509, i64 %t510)
  %t512 = add i64 %t508, %t511
  %t513 = load i64, ptr %local.rc.431
  %t514 = load i64, ptr %local.i.432
  %t515 = call i64 @"vget"(i64 %t513, i64 %t514)
  %t516 = add i64 %t512, %t515
  %t517 = call i64 @"sx_f64_mul"(i64 %t505, i64 %t516)
  %t518 = call i64 @"sx_f64_sub"(i64 %t504, i64 %t517)
  %t519 = call i64 @"vset"(i64 %t500, i64 %t501, i64 %t518)
  %t520 = load i64, ptr %local.i.432
  %t521 = add i64 %t520, 1
  store i64 %t521, ptr %local.i.432
  br label %loop15
endloop15:
  %t522 = load i64, ptr %local.step.425
  %t523 = add i64 %t522, 1
  store i64 %t523, ptr %local.step.425
  br label %loop14
endloop14:
  %t524 = load i64, ptr %local.w.424
  %t525 = load i64, ptr %local.ta
  %t526 = load i64, ptr %local.wa
  %t527 = load i64, ptr %local.n
  %t528 = call i64 @"loss_toward"(i64 %t524, i64 %t525, i64 %t526, i64 %t527)
  store i64 %t528, ptr %local.la.433
  %t529 = load i64, ptr %local.w.424
  %t530 = load i64, ptr %local.tb
  %t531 = load i64, ptr %local.wb
  %t532 = load i64, ptr %local.n
  %t533 = call i64 @"loss_toward"(i64 %t529, i64 %t530, i64 %t531, i64 %t532)
  store i64 %t533, ptr %local.lb.434
  %t534 = load i64, ptr %local.w.424
  %t535 = load i64, ptr %local.tc
  %t536 = load i64, ptr %local.wc
  %t537 = load i64, ptr %local.n
  %t538 = call i64 @"loss_toward"(i64 %t534, i64 %t535, i64 %t536, i64 %t537)
  store i64 %t538, ptr %local.lc.435
  %t539 = load i64, ptr %local.la.433
  %t540 = load i64, ptr %local.lb.434
  %t541 = call i64 @"sx_f64_add"(i64 %t539, i64 %t540)
  %t542 = load i64, ptr %local.lc.435
  %t543 = call i64 @"sx_f64_add"(i64 %t541, i64 %t542)
  ret i64 %t543
}

define i64 @"train_ackley"(i64 %ta, i64 %tb, i64 %tc, i64 %ab, i64 %ac, i64 %ba, i64 %bc, i64 %ca, i64 %cb, i64 %n, i64 %steps, i64 %lr) nounwind {
entry:
  %local.w.544 = alloca i64
  %local.step.545 = alloca i64
  %local.ga.546 = alloca i64
  %local.gb.547 = alloca i64
  %local.gc.548 = alloca i64
  %local.ra.549 = alloca i64
  %local.rb.550 = alloca i64
  %local.rc.551 = alloca i64
  %local.i.552 = alloca i64
  %local.la.553 = alloca i64
  %local.lb.554 = alloca i64
  %local.lc.555 = alloca i64
  %local.ta = alloca i64
  store i64 %ta, ptr %local.ta
  %local.tb = alloca i64
  store i64 %tb, ptr %local.tb
  %local.tc = alloca i64
  store i64 %tc, ptr %local.tc
  %local.ab = alloca i64
  store i64 %ab, ptr %local.ab
  %local.ac = alloca i64
  store i64 %ac, ptr %local.ac
  %local.ba = alloca i64
  store i64 %ba, ptr %local.ba
  %local.bc = alloca i64
  store i64 %bc, ptr %local.bc
  %local.ca = alloca i64
  store i64 %ca, ptr %local.ca
  %local.cb = alloca i64
  store i64 %cb, ptr %local.cb
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %t556 = load i64, ptr %local.n
  %t557 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.33)
  %t558 = call i64 @"vec_fill"(i64 %t556, i64 %t557)
  store i64 %t558, ptr %local.w.544
  store i64 0, ptr %local.step.545
  br label %loop16
loop16:
  %t559 = load i64, ptr %local.step.545
  %t560 = load i64, ptr %local.steps
  %t561 = icmp slt i64 %t559, %t560
  %t562 = zext i1 %t561 to i64
  %t563 = icmp ne i64 %t562, 0
  br i1 %t563, label %body16, label %endloop16
body16:
  %t564 = load i64, ptr %local.w.544
  %t565 = load i64, ptr %local.ta
  %t566 = load i64, ptr %local.n
  %t567 = call i64 @"shifted_ackley_grad"(i64 %t564, i64 %t565, i64 %t566)
  %t568 = load i64, ptr %local.n
  %t569 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.34)
  %t570 = call i64 @"clip_grad"(i64 %t567, i64 %t568, i64 %t569)
  store i64 %t570, ptr %local.ga.546
  %t571 = load i64, ptr %local.w.544
  %t572 = load i64, ptr %local.tb
  %t573 = load i64, ptr %local.n
  %t574 = call i64 @"shifted_ackley_grad"(i64 %t571, i64 %t572, i64 %t573)
  %t575 = load i64, ptr %local.n
  %t576 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.35)
  %t577 = call i64 @"clip_grad"(i64 %t574, i64 %t575, i64 %t576)
  store i64 %t577, ptr %local.gb.547
  %t578 = load i64, ptr %local.w.544
  %t579 = load i64, ptr %local.tc
  %t580 = load i64, ptr %local.n
  %t581 = call i64 @"shifted_ackley_grad"(i64 %t578, i64 %t579, i64 %t580)
  %t582 = load i64, ptr %local.n
  %t583 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.36)
  %t584 = call i64 @"clip_grad"(i64 %t581, i64 %t582, i64 %t583)
  store i64 %t584, ptr %local.gc.548
  %t585 = load i64, ptr %local.ga.546
  %t586 = load i64, ptr %local.gb.547
  %t587 = load i64, ptr %local.ab
  %t588 = load i64, ptr %local.n
  %t589 = call i64 @"project_grad"(i64 %t585, i64 %t586, i64 %t587, i64 %t588)
  %t590 = load i64, ptr %local.gc.548
  %t591 = load i64, ptr %local.ac
  %t592 = load i64, ptr %local.n
  %t593 = call i64 @"project_grad"(i64 %t589, i64 %t590, i64 %t591, i64 %t592)
  store i64 %t593, ptr %local.ra.549
  %t594 = load i64, ptr %local.gb.547
  %t595 = load i64, ptr %local.ga.546
  %t596 = load i64, ptr %local.ba
  %t597 = load i64, ptr %local.n
  %t598 = call i64 @"project_grad"(i64 %t594, i64 %t595, i64 %t596, i64 %t597)
  %t599 = load i64, ptr %local.gc.548
  %t600 = load i64, ptr %local.bc
  %t601 = load i64, ptr %local.n
  %t602 = call i64 @"project_grad"(i64 %t598, i64 %t599, i64 %t600, i64 %t601)
  store i64 %t602, ptr %local.rb.550
  %t603 = load i64, ptr %local.gc.548
  %t604 = load i64, ptr %local.ga.546
  %t605 = load i64, ptr %local.ca
  %t606 = load i64, ptr %local.n
  %t607 = call i64 @"project_grad"(i64 %t603, i64 %t604, i64 %t605, i64 %t606)
  %t608 = load i64, ptr %local.gb.547
  %t609 = load i64, ptr %local.cb
  %t610 = load i64, ptr %local.n
  %t611 = call i64 @"project_grad"(i64 %t607, i64 %t608, i64 %t609, i64 %t610)
  store i64 %t611, ptr %local.rc.551
  store i64 0, ptr %local.i.552
  br label %loop17
loop17:
  %t612 = load i64, ptr %local.i.552
  %t613 = load i64, ptr %local.n
  %t614 = icmp slt i64 %t612, %t613
  %t615 = zext i1 %t614 to i64
  %t616 = icmp ne i64 %t615, 0
  br i1 %t616, label %body17, label %endloop17
body17:
  %t617 = load i64, ptr %local.w.544
  %t618 = load i64, ptr %local.i.552
  %t619 = load i64, ptr %local.w.544
  %t620 = load i64, ptr %local.i.552
  %t621 = call i64 @"vget"(i64 %t619, i64 %t620)
  %t622 = load i64, ptr %local.lr
  %t623 = load i64, ptr %local.ra.549
  %t624 = load i64, ptr %local.i.552
  %t625 = call i64 @"vget"(i64 %t623, i64 %t624)
  %t626 = load i64, ptr %local.rb.550
  %t627 = load i64, ptr %local.i.552
  %t628 = call i64 @"vget"(i64 %t626, i64 %t627)
  %t629 = add i64 %t625, %t628
  %t630 = load i64, ptr %local.rc.551
  %t631 = load i64, ptr %local.i.552
  %t632 = call i64 @"vget"(i64 %t630, i64 %t631)
  %t633 = add i64 %t629, %t632
  %t634 = call i64 @"sx_f64_mul"(i64 %t622, i64 %t633)
  %t635 = call i64 @"sx_f64_sub"(i64 %t621, i64 %t634)
  %t636 = call i64 @"vset"(i64 %t617, i64 %t618, i64 %t635)
  %t637 = load i64, ptr %local.i.552
  %t638 = add i64 %t637, 1
  store i64 %t638, ptr %local.i.552
  br label %loop17
endloop17:
  %t639 = load i64, ptr %local.step.545
  %t640 = add i64 %t639, 1
  store i64 %t640, ptr %local.step.545
  br label %loop16
endloop16:
  %t641 = load i64, ptr %local.w.544
  %t642 = load i64, ptr %local.ta
  %t643 = load i64, ptr %local.n
  %t644 = call i64 @"shifted_ackley"(i64 %t641, i64 %t642, i64 %t643)
  store i64 %t644, ptr %local.la.553
  %t645 = load i64, ptr %local.w.544
  %t646 = load i64, ptr %local.tb
  %t647 = load i64, ptr %local.n
  %t648 = call i64 @"shifted_ackley"(i64 %t645, i64 %t646, i64 %t647)
  store i64 %t648, ptr %local.lb.554
  %t649 = load i64, ptr %local.w.544
  %t650 = load i64, ptr %local.tc
  %t651 = load i64, ptr %local.n
  %t652 = call i64 @"shifted_ackley"(i64 %t649, i64 %t650, i64 %t651)
  store i64 %t652, ptr %local.lc.555
  %t653 = load i64, ptr %local.la.553
  %t654 = load i64, ptr %local.lb.554
  %t655 = call i64 @"sx_f64_add"(i64 %t653, i64 %t654)
  %t656 = load i64, ptr %local.lc.555
  %t657 = call i64 @"sx_f64_add"(i64 %t655, i64 %t656)
  ret i64 %t657
}

define i64 @"mg_adv"(i64 %ta, i64 %tb, i64 %tc, i64 %wa, i64 %wb, i64 %wc, i64 %ab, i64 %ac, i64 %ba, i64 %bc, i64 %ca, i64 %cb, i64 %which, i64 %n, i64 %steps, i64 %lr) nounwind {
entry:
  %local.h.658 = alloca i64
  %local.abp.659 = alloca i64
  %local.acp.660 = alloca i64
  %local.bap.661 = alloca i64
  %local.bcp.662 = alloca i64
  %local.cap.663 = alloca i64
  %local.cbp.664 = alloca i64
  %local.abm.665 = alloca i64
  %local.acm.666 = alloca i64
  %local.bam.667 = alloca i64
  %local.bcm.668 = alloca i64
  %local.cam.669 = alloca i64
  %local.cbm.670 = alloca i64
  %local.lp.671 = alloca i64
  %local.lm.672 = alloca i64
  %local.ta = alloca i64
  store i64 %ta, ptr %local.ta
  %local.tb = alloca i64
  store i64 %tb, ptr %local.tb
  %local.tc = alloca i64
  store i64 %tc, ptr %local.tc
  %local.wa = alloca i64
  store i64 %wa, ptr %local.wa
  %local.wb = alloca i64
  store i64 %wb, ptr %local.wb
  %local.wc = alloca i64
  store i64 %wc, ptr %local.wc
  %local.ab = alloca i64
  store i64 %ab, ptr %local.ab
  %local.ac = alloca i64
  store i64 %ac, ptr %local.ac
  %local.ba = alloca i64
  store i64 %ba, ptr %local.ba
  %local.bc = alloca i64
  store i64 %bc, ptr %local.bc
  %local.ca = alloca i64
  store i64 %ca, ptr %local.ca
  %local.cb = alloca i64
  store i64 %cb, ptr %local.cb
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %t673 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.37)
  store i64 %t673, ptr %local.h.658
  %t674 = load i64, ptr %local.ab
  store i64 %t674, ptr %local.abp.659
  %t675 = load i64, ptr %local.ac
  store i64 %t675, ptr %local.acp.660
  %t676 = load i64, ptr %local.ba
  store i64 %t676, ptr %local.bap.661
  %t677 = load i64, ptr %local.bc
  store i64 %t677, ptr %local.bcp.662
  %t678 = load i64, ptr %local.ca
  store i64 %t678, ptr %local.cap.663
  %t679 = load i64, ptr %local.cb
  store i64 %t679, ptr %local.cbp.664
  %t680 = load i64, ptr %local.ab
  store i64 %t680, ptr %local.abm.665
  %t681 = load i64, ptr %local.ac
  store i64 %t681, ptr %local.acm.666
  %t682 = load i64, ptr %local.ba
  store i64 %t682, ptr %local.bam.667
  %t683 = load i64, ptr %local.bc
  store i64 %t683, ptr %local.bcm.668
  %t684 = load i64, ptr %local.ca
  store i64 %t684, ptr %local.cam.669
  %t685 = load i64, ptr %local.cb
  store i64 %t685, ptr %local.cbm.670
  %t686 = load i64, ptr %local.which
  %t687 = icmp eq i64 %t686, 0
  %t688 = zext i1 %t687 to i64
  %t689 = icmp ne i64 %t688, 0
  br i1 %t689, label %then18, label %else18
then18:
  %t690 = load i64, ptr %local.ab
  %t691 = load i64, ptr %local.h.658
  %t692 = call i64 @"sx_f64_add"(i64 %t690, i64 %t691)
  store i64 %t692, ptr %local.abp.659
  %t693 = load i64, ptr %local.ab
  %t694 = load i64, ptr %local.h.658
  %t695 = call i64 @"sx_f64_sub"(i64 %t693, i64 %t694)
  store i64 %t695, ptr %local.abm.665
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t696 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t697 = load i64, ptr %local.which
  %t698 = icmp eq i64 %t697, 1
  %t699 = zext i1 %t698 to i64
  %t700 = icmp ne i64 %t699, 0
  br i1 %t700, label %then19, label %else19
then19:
  %t701 = load i64, ptr %local.ac
  %t702 = load i64, ptr %local.h.658
  %t703 = call i64 @"sx_f64_add"(i64 %t701, i64 %t702)
  store i64 %t703, ptr %local.acp.660
  %t704 = load i64, ptr %local.ac
  %t705 = load i64, ptr %local.h.658
  %t706 = call i64 @"sx_f64_sub"(i64 %t704, i64 %t705)
  store i64 %t706, ptr %local.acm.666
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t707 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t708 = load i64, ptr %local.which
  %t709 = icmp eq i64 %t708, 2
  %t710 = zext i1 %t709 to i64
  %t711 = icmp ne i64 %t710, 0
  br i1 %t711, label %then20, label %else20
then20:
  %t712 = load i64, ptr %local.ba
  %t713 = load i64, ptr %local.h.658
  %t714 = call i64 @"sx_f64_add"(i64 %t712, i64 %t713)
  store i64 %t714, ptr %local.bap.661
  %t715 = load i64, ptr %local.ba
  %t716 = load i64, ptr %local.h.658
  %t717 = call i64 @"sx_f64_sub"(i64 %t715, i64 %t716)
  store i64 %t717, ptr %local.bam.667
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t718 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t719 = load i64, ptr %local.which
  %t720 = icmp eq i64 %t719, 3
  %t721 = zext i1 %t720 to i64
  %t722 = icmp ne i64 %t721, 0
  br i1 %t722, label %then21, label %else21
then21:
  %t723 = load i64, ptr %local.bc
  %t724 = load i64, ptr %local.h.658
  %t725 = call i64 @"sx_f64_add"(i64 %t723, i64 %t724)
  store i64 %t725, ptr %local.bcp.662
  %t726 = load i64, ptr %local.bc
  %t727 = load i64, ptr %local.h.658
  %t728 = call i64 @"sx_f64_sub"(i64 %t726, i64 %t727)
  store i64 %t728, ptr %local.bcm.668
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t729 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t730 = load i64, ptr %local.which
  %t731 = icmp eq i64 %t730, 4
  %t732 = zext i1 %t731 to i64
  %t733 = icmp ne i64 %t732, 0
  br i1 %t733, label %then22, label %else22
then22:
  %t734 = load i64, ptr %local.ca
  %t735 = load i64, ptr %local.h.658
  %t736 = call i64 @"sx_f64_add"(i64 %t734, i64 %t735)
  store i64 %t736, ptr %local.cap.663
  %t737 = load i64, ptr %local.ca
  %t738 = load i64, ptr %local.h.658
  %t739 = call i64 @"sx_f64_sub"(i64 %t737, i64 %t738)
  store i64 %t739, ptr %local.cam.669
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t740 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t741 = load i64, ptr %local.which
  %t742 = icmp eq i64 %t741, 5
  %t743 = zext i1 %t742 to i64
  %t744 = icmp ne i64 %t743, 0
  br i1 %t744, label %then23, label %else23
then23:
  %t745 = load i64, ptr %local.cb
  %t746 = load i64, ptr %local.h.658
  %t747 = call i64 @"sx_f64_add"(i64 %t745, i64 %t746)
  store i64 %t747, ptr %local.cbp.664
  %t748 = load i64, ptr %local.cb
  %t749 = load i64, ptr %local.h.658
  %t750 = call i64 @"sx_f64_sub"(i64 %t748, i64 %t749)
  store i64 %t750, ptr %local.cbm.670
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t751 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t752 = load i64, ptr %local.ta
  %t753 = load i64, ptr %local.tb
  %t754 = load i64, ptr %local.tc
  %t755 = load i64, ptr %local.wa
  %t756 = load i64, ptr %local.wb
  %t757 = load i64, ptr %local.wc
  %t758 = load i64, ptr %local.abp.659
  %t759 = load i64, ptr %local.acp.660
  %t760 = load i64, ptr %local.bap.661
  %t761 = load i64, ptr %local.bcp.662
  %t762 = load i64, ptr %local.cap.663
  %t763 = load i64, ptr %local.cbp.664
  %t764 = load i64, ptr %local.n
  %t765 = load i64, ptr %local.steps
  %t766 = load i64, ptr %local.lr
  %t767 = call i64 @"train_adversarial"(i64 %t752, i64 %t753, i64 %t754, i64 %t755, i64 %t756, i64 %t757, i64 %t758, i64 %t759, i64 %t760, i64 %t761, i64 %t762, i64 %t763, i64 %t764, i64 %t765, i64 %t766)
  store i64 %t767, ptr %local.lp.671
  %t768 = load i64, ptr %local.ta
  %t769 = load i64, ptr %local.tb
  %t770 = load i64, ptr %local.tc
  %t771 = load i64, ptr %local.wa
  %t772 = load i64, ptr %local.wb
  %t773 = load i64, ptr %local.wc
  %t774 = load i64, ptr %local.abm.665
  %t775 = load i64, ptr %local.acm.666
  %t776 = load i64, ptr %local.bam.667
  %t777 = load i64, ptr %local.bcm.668
  %t778 = load i64, ptr %local.cam.669
  %t779 = load i64, ptr %local.cbm.670
  %t780 = load i64, ptr %local.n
  %t781 = load i64, ptr %local.steps
  %t782 = load i64, ptr %local.lr
  %t783 = call i64 @"train_adversarial"(i64 %t768, i64 %t769, i64 %t770, i64 %t771, i64 %t772, i64 %t773, i64 %t774, i64 %t775, i64 %t776, i64 %t777, i64 %t778, i64 %t779, i64 %t780, i64 %t781, i64 %t782)
  store i64 %t783, ptr %local.lm.672
  %t784 = load i64, ptr %local.lp.671
  %t785 = load i64, ptr %local.lm.672
  %t786 = call i64 @"sx_f64_sub"(i64 %t784, i64 %t785)
  %t787 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.38)
  %t788 = load i64, ptr %local.h.658
  %t789 = call i64 @"sx_f64_mul"(i64 %t787, i64 %t788)
  %t790 = call i64 @"sx_f64_div"(i64 %t786, i64 %t789)
  ret i64 %t790
}

define i64 @"mg_ack"(i64 %ta, i64 %tb, i64 %tc, i64 %ab, i64 %ac, i64 %ba, i64 %bc, i64 %ca, i64 %cb, i64 %which, i64 %n, i64 %steps, i64 %lr) nounwind {
entry:
  %local.h.791 = alloca i64
  %local.abp.792 = alloca i64
  %local.acp.793 = alloca i64
  %local.bap.794 = alloca i64
  %local.bcp.795 = alloca i64
  %local.cap.796 = alloca i64
  %local.cbp.797 = alloca i64
  %local.abm.798 = alloca i64
  %local.acm.799 = alloca i64
  %local.bam.800 = alloca i64
  %local.bcm.801 = alloca i64
  %local.cam.802 = alloca i64
  %local.cbm.803 = alloca i64
  %local.lp.804 = alloca i64
  %local.lm.805 = alloca i64
  %local.ta = alloca i64
  store i64 %ta, ptr %local.ta
  %local.tb = alloca i64
  store i64 %tb, ptr %local.tb
  %local.tc = alloca i64
  store i64 %tc, ptr %local.tc
  %local.ab = alloca i64
  store i64 %ab, ptr %local.ab
  %local.ac = alloca i64
  store i64 %ac, ptr %local.ac
  %local.ba = alloca i64
  store i64 %ba, ptr %local.ba
  %local.bc = alloca i64
  store i64 %bc, ptr %local.bc
  %local.ca = alloca i64
  store i64 %ca, ptr %local.ca
  %local.cb = alloca i64
  store i64 %cb, ptr %local.cb
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %t806 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.39)
  store i64 %t806, ptr %local.h.791
  %t807 = load i64, ptr %local.ab
  store i64 %t807, ptr %local.abp.792
  %t808 = load i64, ptr %local.ac
  store i64 %t808, ptr %local.acp.793
  %t809 = load i64, ptr %local.ba
  store i64 %t809, ptr %local.bap.794
  %t810 = load i64, ptr %local.bc
  store i64 %t810, ptr %local.bcp.795
  %t811 = load i64, ptr %local.ca
  store i64 %t811, ptr %local.cap.796
  %t812 = load i64, ptr %local.cb
  store i64 %t812, ptr %local.cbp.797
  %t813 = load i64, ptr %local.ab
  store i64 %t813, ptr %local.abm.798
  %t814 = load i64, ptr %local.ac
  store i64 %t814, ptr %local.acm.799
  %t815 = load i64, ptr %local.ba
  store i64 %t815, ptr %local.bam.800
  %t816 = load i64, ptr %local.bc
  store i64 %t816, ptr %local.bcm.801
  %t817 = load i64, ptr %local.ca
  store i64 %t817, ptr %local.cam.802
  %t818 = load i64, ptr %local.cb
  store i64 %t818, ptr %local.cbm.803
  %t819 = load i64, ptr %local.which
  %t820 = icmp eq i64 %t819, 0
  %t821 = zext i1 %t820 to i64
  %t822 = icmp ne i64 %t821, 0
  br i1 %t822, label %then24, label %else24
then24:
  %t823 = load i64, ptr %local.ab
  %t824 = load i64, ptr %local.h.791
  %t825 = call i64 @"sx_f64_add"(i64 %t823, i64 %t824)
  store i64 %t825, ptr %local.abp.792
  %t826 = load i64, ptr %local.ab
  %t827 = load i64, ptr %local.h.791
  %t828 = call i64 @"sx_f64_sub"(i64 %t826, i64 %t827)
  store i64 %t828, ptr %local.abm.798
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t829 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t830 = load i64, ptr %local.which
  %t831 = icmp eq i64 %t830, 1
  %t832 = zext i1 %t831 to i64
  %t833 = icmp ne i64 %t832, 0
  br i1 %t833, label %then25, label %else25
then25:
  %t834 = load i64, ptr %local.ac
  %t835 = load i64, ptr %local.h.791
  %t836 = call i64 @"sx_f64_add"(i64 %t834, i64 %t835)
  store i64 %t836, ptr %local.acp.793
  %t837 = load i64, ptr %local.ac
  %t838 = load i64, ptr %local.h.791
  %t839 = call i64 @"sx_f64_sub"(i64 %t837, i64 %t838)
  store i64 %t839, ptr %local.acm.799
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t840 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t841 = load i64, ptr %local.which
  %t842 = icmp eq i64 %t841, 2
  %t843 = zext i1 %t842 to i64
  %t844 = icmp ne i64 %t843, 0
  br i1 %t844, label %then26, label %else26
then26:
  %t845 = load i64, ptr %local.ba
  %t846 = load i64, ptr %local.h.791
  %t847 = call i64 @"sx_f64_add"(i64 %t845, i64 %t846)
  store i64 %t847, ptr %local.bap.794
  %t848 = load i64, ptr %local.ba
  %t849 = load i64, ptr %local.h.791
  %t850 = call i64 @"sx_f64_sub"(i64 %t848, i64 %t849)
  store i64 %t850, ptr %local.bam.800
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t851 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t852 = load i64, ptr %local.which
  %t853 = icmp eq i64 %t852, 3
  %t854 = zext i1 %t853 to i64
  %t855 = icmp ne i64 %t854, 0
  br i1 %t855, label %then27, label %else27
then27:
  %t856 = load i64, ptr %local.bc
  %t857 = load i64, ptr %local.h.791
  %t858 = call i64 @"sx_f64_add"(i64 %t856, i64 %t857)
  store i64 %t858, ptr %local.bcp.795
  %t859 = load i64, ptr %local.bc
  %t860 = load i64, ptr %local.h.791
  %t861 = call i64 @"sx_f64_sub"(i64 %t859, i64 %t860)
  store i64 %t861, ptr %local.bcm.801
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t862 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t863 = load i64, ptr %local.which
  %t864 = icmp eq i64 %t863, 4
  %t865 = zext i1 %t864 to i64
  %t866 = icmp ne i64 %t865, 0
  br i1 %t866, label %then28, label %else28
then28:
  %t867 = load i64, ptr %local.ca
  %t868 = load i64, ptr %local.h.791
  %t869 = call i64 @"sx_f64_add"(i64 %t867, i64 %t868)
  store i64 %t869, ptr %local.cap.796
  %t870 = load i64, ptr %local.ca
  %t871 = load i64, ptr %local.h.791
  %t872 = call i64 @"sx_f64_sub"(i64 %t870, i64 %t871)
  store i64 %t872, ptr %local.cam.802
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t873 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t874 = load i64, ptr %local.which
  %t875 = icmp eq i64 %t874, 5
  %t876 = zext i1 %t875 to i64
  %t877 = icmp ne i64 %t876, 0
  br i1 %t877, label %then29, label %else29
then29:
  %t878 = load i64, ptr %local.cb
  %t879 = load i64, ptr %local.h.791
  %t880 = call i64 @"sx_f64_add"(i64 %t878, i64 %t879)
  store i64 %t880, ptr %local.cbp.797
  %t881 = load i64, ptr %local.cb
  %t882 = load i64, ptr %local.h.791
  %t883 = call i64 @"sx_f64_sub"(i64 %t881, i64 %t882)
  store i64 %t883, ptr %local.cbm.803
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t884 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t885 = load i64, ptr %local.ta
  %t886 = load i64, ptr %local.tb
  %t887 = load i64, ptr %local.tc
  %t888 = load i64, ptr %local.abp.792
  %t889 = load i64, ptr %local.acp.793
  %t890 = load i64, ptr %local.bap.794
  %t891 = load i64, ptr %local.bcp.795
  %t892 = load i64, ptr %local.cap.796
  %t893 = load i64, ptr %local.cbp.797
  %t894 = load i64, ptr %local.n
  %t895 = load i64, ptr %local.steps
  %t896 = load i64, ptr %local.lr
  %t897 = call i64 @"train_ackley"(i64 %t885, i64 %t886, i64 %t887, i64 %t888, i64 %t889, i64 %t890, i64 %t891, i64 %t892, i64 %t893, i64 %t894, i64 %t895, i64 %t896)
  store i64 %t897, ptr %local.lp.804
  %t898 = load i64, ptr %local.ta
  %t899 = load i64, ptr %local.tb
  %t900 = load i64, ptr %local.tc
  %t901 = load i64, ptr %local.abm.798
  %t902 = load i64, ptr %local.acm.799
  %t903 = load i64, ptr %local.bam.800
  %t904 = load i64, ptr %local.bcm.801
  %t905 = load i64, ptr %local.cam.802
  %t906 = load i64, ptr %local.cbm.803
  %t907 = load i64, ptr %local.n
  %t908 = load i64, ptr %local.steps
  %t909 = load i64, ptr %local.lr
  %t910 = call i64 @"train_ackley"(i64 %t898, i64 %t899, i64 %t900, i64 %t901, i64 %t902, i64 %t903, i64 %t904, i64 %t905, i64 %t906, i64 %t907, i64 %t908, i64 %t909)
  store i64 %t910, ptr %local.lm.805
  %t911 = load i64, ptr %local.lp.804
  %t912 = load i64, ptr %local.lm.805
  %t913 = call i64 @"sx_f64_sub"(i64 %t911, i64 %t912)
  %t914 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.40)
  %t915 = load i64, ptr %local.h.791
  %t916 = call i64 @"sx_f64_mul"(i64 %t914, i64 %t915)
  %t917 = call i64 @"sx_f64_div"(i64 %t913, i64 %t916)
  ret i64 %t917
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t918 = load i64, ptr %local.x
  %t919 = load i64, ptr %local.lo
  %t920 = call i64 @"sx_f64_lt"(i64 %t918, i64 %t919)
  %t921 = icmp ne i64 %t920, 0
  br i1 %t921, label %then30, label %else30
then30:
  %t922 = load i64, ptr %local.lo
  ret i64 %t922
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t923 = phi i64 [ 0, %else30_end ]
  %t924 = load i64, ptr %local.x
  %t925 = load i64, ptr %local.hi
  %t926 = call i64 @"sx_f64_gt"(i64 %t924, i64 %t925)
  %t927 = icmp ne i64 %t926, 0
  br i1 %t927, label %then31, label %else31
then31:
  %t928 = load i64, ptr %local.hi
  ret i64 %t928
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t929 = phi i64 [ 0, %else31_end ]
  %t930 = load i64, ptr %local.x
  ret i64 %t930
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.failures.931 = alloca i64
  %local.n.932 = alloca i64
  %local.ta.933 = alloca i64
  %local.tb.934 = alloca i64
  %local.tc.935 = alloca i64
  %local.k.936 = alloca i64
  %local.fk.937 = alloca i64
  %local.wa.938 = alloca i64
  %local.wb.939 = alloca i64
  %local.wc.940 = alloca i64
  %local.ab.941 = alloca i64
  %local.ac.942 = alloca i64
  %local.ba.943 = alloca i64
  %local.bc.944 = alloca i64
  %local.ca.945 = alloca i64
  %local.cb.946 = alloca i64
  %local.mg.947 = alloca i64
  %local.cycle.948 = alloca i64
  %local.loss.949 = alloca i64
  %local.inner.950 = alloca i64
  %local.lr.951 = alloca i64
  %local.mlr.952 = alloca i64
  %local.mcycles.953 = alloca i64
  %local.loss_none.954 = alloca i64
  %local.loss_unif.955 = alloca i64
  %local.a_tgt.956 = alloca i64
  %local.b_tgt.957 = alloca i64
  %local.c_tgt.958 = alloca i64
  %local.j.959 = alloca i64
  %local.fj.960 = alloca i64
  %local.a2_ab.961 = alloca i64
  %local.a2_ac.962 = alloca i64
  %local.a2_ba.963 = alloca i64
  %local.a2_bc.964 = alloca i64
  %local.a2_ca.965 = alloca i64
  %local.a2_cb.966 = alloca i64
  %local.ack_inner.967 = alloca i64
  %local.ack_lr.968 = alloca i64
  %local.ack_mlr.969 = alloca i64
  %local.ack_none.970 = alloca i64
  %local.ack_unif.971 = alloca i64
  %local.ack_learned.972 = alloca i64
  store i64 0, ptr %local.failures.931
  store i64 8, ptr %local.n.932
  %t973 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.41)
  %t974 = ptrtoint ptr %t973 to i64
  %t975 = inttoptr i64 %t974 to ptr
  call void @intrinsic_println(ptr %t975)
  %t976 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.42)
  %t977 = ptrtoint ptr %t976 to i64
  %t978 = inttoptr i64 %t977 to ptr
  call void @intrinsic_println(ptr %t978)
  %t979 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.43)
  %t980 = ptrtoint ptr %t979 to i64
  %t981 = inttoptr i64 %t980 to ptr
  call void @intrinsic_println(ptr %t981)
  %t982 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.44)
  %t983 = ptrtoint ptr %t982 to i64
  %t984 = inttoptr i64 %t983 to ptr
  call void @intrinsic_println(ptr %t984)
  %t985 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.45)
  %t986 = ptrtoint ptr %t985 to i64
  %t987 = inttoptr i64 %t986 to ptr
  call void @intrinsic_println(ptr %t987)
  %t988 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.46)
  %t989 = ptrtoint ptr %t988 to i64
  %t990 = inttoptr i64 %t989 to ptr
  call void @intrinsic_println(ptr %t990)
  %t991 = load i64, ptr %local.n.932
  %t992 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.47)
  %t993 = call i64 @"vec_fill"(i64 %t991, i64 %t992)
  store i64 %t993, ptr %local.ta.933
  %t994 = load i64, ptr %local.n.932
  %t995 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.48)
  %t996 = call i64 @"vec_fill"(i64 %t994, i64 %t995)
  store i64 %t996, ptr %local.tb.934
  %t997 = load i64, ptr %local.n.932
  %t998 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.49)
  %t999 = call i64 @"vec_fill"(i64 %t997, i64 %t998)
  store i64 %t999, ptr %local.tc.935
  store i64 0, ptr %local.k.936
  br label %loop32
loop32:
  %t1000 = load i64, ptr %local.k.936
  %t1001 = load i64, ptr %local.n.932
  %t1002 = icmp slt i64 %t1000, %t1001
  %t1003 = zext i1 %t1002 to i64
  %t1004 = icmp ne i64 %t1003, 0
  br i1 %t1004, label %body32, label %endloop32
body32:
  %t1005 = load i64, ptr %local.k.936
  %t1006 = call i64 @"sx_int_to_f64"(i64 %t1005)
  store i64 %t1006, ptr %local.fk.937
  %t1007 = load i64, ptr %local.ta.933
  %t1008 = load i64, ptr %local.k.936
  %t1009 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.50)
  %t1010 = load i64, ptr %local.fk.937
  %t1011 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.51)
  %t1012 = call i64 @"sx_f64_mul"(i64 %t1010, i64 %t1011)
  %t1013 = call i64 @"sx_f64_add"(i64 %t1009, i64 %t1012)
  %t1014 = call i64 @"vset"(i64 %t1007, i64 %t1008, i64 %t1013)
  %t1015 = load i64, ptr %local.tb.934
  %t1016 = load i64, ptr %local.k.936
  %t1017 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.52)
  %t1018 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.53)
  %t1019 = call i64 @"sx_f64_sub"(i64 %t1017, i64 %t1018)
  %t1020 = load i64, ptr %local.fk.937
  %t1021 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.54)
  %t1022 = call i64 @"sx_f64_mul"(i64 %t1020, i64 %t1021)
  %t1023 = call i64 @"sx_f64_sub"(i64 %t1019, i64 %t1022)
  %t1024 = call i64 @"vset"(i64 %t1015, i64 %t1016, i64 %t1023)
  %t1025 = load i64, ptr %local.tc.935
  %t1026 = load i64, ptr %local.k.936
  %t1027 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.55)
  %t1028 = load i64, ptr %local.fk.937
  %t1029 = call i64 @"sin_f64"(i64 %t1028)
  %t1030 = call i64 @"sx_f64_mul"(i64 %t1027, i64 %t1029)
  %t1031 = call i64 @"vset"(i64 %t1025, i64 %t1026, i64 %t1030)
  %t1032 = load i64, ptr %local.k.936
  %t1033 = add i64 %t1032, 1
  store i64 %t1033, ptr %local.k.936
  br label %loop32
endloop32:
  %t1034 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.56)
  store i64 %t1034, ptr %local.wa.938
  %t1035 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.57)
  store i64 %t1035, ptr %local.wb.939
  %t1036 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.58)
  store i64 %t1036, ptr %local.wc.940
  %t1037 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.59)
  store i64 %t1037, ptr %local.ab.941
  %t1038 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.60)
  store i64 %t1038, ptr %local.ac.942
  %t1039 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.61)
  store i64 %t1039, ptr %local.ba.943
  %t1040 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.62)
  store i64 %t1040, ptr %local.bc.944
  %t1041 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.63)
  store i64 %t1041, ptr %local.ca.945
  %t1042 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.64)
  store i64 %t1042, ptr %local.cb.946
  %t1043 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.65)
  store i64 %t1043, ptr %local.mg.947
  store i64 0, ptr %local.cycle.948
  %t1044 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.66)
  store i64 %t1044, ptr %local.loss.949
  store i64 500, ptr %local.inner.950
  %t1045 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.67)
  store i64 %t1045, ptr %local.lr.951
  %t1046 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.68)
  store i64 %t1046, ptr %local.mlr.952
  store i64 40, ptr %local.mcycles.953
  %t1047 = load i64, ptr %local.ta.933
  %t1048 = load i64, ptr %local.tb.934
  %t1049 = load i64, ptr %local.tc.935
  %t1050 = load i64, ptr %local.wa.938
  %t1051 = load i64, ptr %local.wb.939
  %t1052 = load i64, ptr %local.wc.940
  %t1053 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.69)
  %t1054 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.70)
  %t1055 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.71)
  %t1056 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.72)
  %t1057 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.73)
  %t1058 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.74)
  %t1059 = load i64, ptr %local.n.932
  %t1060 = load i64, ptr %local.inner.950
  %t1061 = load i64, ptr %local.lr.951
  %t1062 = call i64 @"train_adversarial"(i64 %t1047, i64 %t1048, i64 %t1049, i64 %t1050, i64 %t1051, i64 %t1052, i64 %t1053, i64 %t1054, i64 %t1055, i64 %t1056, i64 %t1057, i64 %t1058, i64 %t1059, i64 %t1060, i64 %t1061)
  store i64 %t1062, ptr %local.loss_none.954
  %t1063 = load i64, ptr %local.ta.933
  %t1064 = load i64, ptr %local.tb.934
  %t1065 = load i64, ptr %local.tc.935
  %t1066 = load i64, ptr %local.wa.938
  %t1067 = load i64, ptr %local.wb.939
  %t1068 = load i64, ptr %local.wc.940
  %t1069 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.75)
  %t1070 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.76)
  %t1071 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.77)
  %t1072 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.78)
  %t1073 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.79)
  %t1074 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.80)
  %t1075 = load i64, ptr %local.n.932
  %t1076 = load i64, ptr %local.inner.950
  %t1077 = load i64, ptr %local.lr.951
  %t1078 = call i64 @"train_adversarial"(i64 %t1063, i64 %t1064, i64 %t1065, i64 %t1066, i64 %t1067, i64 %t1068, i64 %t1069, i64 %t1070, i64 %t1071, i64 %t1072, i64 %t1073, i64 %t1074, i64 %t1075, i64 %t1076, i64 %t1077)
  store i64 %t1078, ptr %local.loss_unif.955
  %t1079 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.81)
  %t1080 = ptrtoint ptr %t1079 to i64
  %t1081 = inttoptr i64 %t1080 to ptr
  call void @intrinsic_print(ptr %t1081)
  %t1082 = load i64, ptr %local.loss_none.954
  %t1083 = call i64 @"print_f64"(i64 %t1082)
  %t1084 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.82)
  %t1085 = ptrtoint ptr %t1084 to i64
  %t1086 = inttoptr i64 %t1085 to ptr
  call void @intrinsic_print(ptr %t1086)
  %t1087 = load i64, ptr %local.loss_unif.955
  %t1088 = call i64 @"print_f64"(i64 %t1087)
  %t1089 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.83)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = inttoptr i64 %t1090 to ptr
  call void @intrinsic_println(ptr %t1091)
  br label %loop33
loop33:
  %t1092 = load i64, ptr %local.cycle.948
  %t1093 = load i64, ptr %local.mcycles.953
  %t1094 = icmp slt i64 %t1092, %t1093
  %t1095 = zext i1 %t1094 to i64
  %t1096 = icmp ne i64 %t1095, 0
  br i1 %t1096, label %body33, label %endloop33
body33:
  %t1097 = load i64, ptr %local.ta.933
  %t1098 = load i64, ptr %local.tb.934
  %t1099 = load i64, ptr %local.tc.935
  %t1100 = load i64, ptr %local.wa.938
  %t1101 = load i64, ptr %local.wb.939
  %t1102 = load i64, ptr %local.wc.940
  %t1103 = load i64, ptr %local.ab.941
  %t1104 = load i64, ptr %local.ac.942
  %t1105 = load i64, ptr %local.ba.943
  %t1106 = load i64, ptr %local.bc.944
  %t1107 = load i64, ptr %local.ca.945
  %t1108 = load i64, ptr %local.cb.946
  %t1109 = load i64, ptr %local.n.932
  %t1110 = load i64, ptr %local.inner.950
  %t1111 = load i64, ptr %local.lr.951
  %t1112 = call i64 @"mg_adv"(i64 %t1097, i64 %t1098, i64 %t1099, i64 %t1100, i64 %t1101, i64 %t1102, i64 %t1103, i64 %t1104, i64 %t1105, i64 %t1106, i64 %t1107, i64 %t1108, i64 0, i64 %t1109, i64 %t1110, i64 %t1111)
  store i64 %t1112, ptr %local.mg.947
  %t1113 = load i64, ptr %local.ab.941
  %t1114 = load i64, ptr %local.mlr.952
  %t1115 = load i64, ptr %local.mg.947
  %t1116 = call i64 @"sx_f64_mul"(i64 %t1114, i64 %t1115)
  %t1117 = call i64 @"sx_f64_sub"(i64 %t1113, i64 %t1116)
  %t1118 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.84)
  %t1119 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.85)
  %t1120 = call i64 @"clamp"(i64 %t1117, i64 %t1118, i64 %t1119)
  store i64 %t1120, ptr %local.ab.941
  %t1121 = load i64, ptr %local.ta.933
  %t1122 = load i64, ptr %local.tb.934
  %t1123 = load i64, ptr %local.tc.935
  %t1124 = load i64, ptr %local.wa.938
  %t1125 = load i64, ptr %local.wb.939
  %t1126 = load i64, ptr %local.wc.940
  %t1127 = load i64, ptr %local.ab.941
  %t1128 = load i64, ptr %local.ac.942
  %t1129 = load i64, ptr %local.ba.943
  %t1130 = load i64, ptr %local.bc.944
  %t1131 = load i64, ptr %local.ca.945
  %t1132 = load i64, ptr %local.cb.946
  %t1133 = load i64, ptr %local.n.932
  %t1134 = load i64, ptr %local.inner.950
  %t1135 = load i64, ptr %local.lr.951
  %t1136 = call i64 @"mg_adv"(i64 %t1121, i64 %t1122, i64 %t1123, i64 %t1124, i64 %t1125, i64 %t1126, i64 %t1127, i64 %t1128, i64 %t1129, i64 %t1130, i64 %t1131, i64 %t1132, i64 1, i64 %t1133, i64 %t1134, i64 %t1135)
  store i64 %t1136, ptr %local.mg.947
  %t1137 = load i64, ptr %local.ac.942
  %t1138 = load i64, ptr %local.mlr.952
  %t1139 = load i64, ptr %local.mg.947
  %t1140 = call i64 @"sx_f64_mul"(i64 %t1138, i64 %t1139)
  %t1141 = call i64 @"sx_f64_sub"(i64 %t1137, i64 %t1140)
  %t1142 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.86)
  %t1143 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.87)
  %t1144 = call i64 @"clamp"(i64 %t1141, i64 %t1142, i64 %t1143)
  store i64 %t1144, ptr %local.ac.942
  %t1145 = load i64, ptr %local.ta.933
  %t1146 = load i64, ptr %local.tb.934
  %t1147 = load i64, ptr %local.tc.935
  %t1148 = load i64, ptr %local.wa.938
  %t1149 = load i64, ptr %local.wb.939
  %t1150 = load i64, ptr %local.wc.940
  %t1151 = load i64, ptr %local.ab.941
  %t1152 = load i64, ptr %local.ac.942
  %t1153 = load i64, ptr %local.ba.943
  %t1154 = load i64, ptr %local.bc.944
  %t1155 = load i64, ptr %local.ca.945
  %t1156 = load i64, ptr %local.cb.946
  %t1157 = load i64, ptr %local.n.932
  %t1158 = load i64, ptr %local.inner.950
  %t1159 = load i64, ptr %local.lr.951
  %t1160 = call i64 @"mg_adv"(i64 %t1145, i64 %t1146, i64 %t1147, i64 %t1148, i64 %t1149, i64 %t1150, i64 %t1151, i64 %t1152, i64 %t1153, i64 %t1154, i64 %t1155, i64 %t1156, i64 2, i64 %t1157, i64 %t1158, i64 %t1159)
  store i64 %t1160, ptr %local.mg.947
  %t1161 = load i64, ptr %local.ba.943
  %t1162 = load i64, ptr %local.mlr.952
  %t1163 = load i64, ptr %local.mg.947
  %t1164 = call i64 @"sx_f64_mul"(i64 %t1162, i64 %t1163)
  %t1165 = call i64 @"sx_f64_sub"(i64 %t1161, i64 %t1164)
  %t1166 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.88)
  %t1167 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.89)
  %t1168 = call i64 @"clamp"(i64 %t1165, i64 %t1166, i64 %t1167)
  store i64 %t1168, ptr %local.ba.943
  %t1169 = load i64, ptr %local.ta.933
  %t1170 = load i64, ptr %local.tb.934
  %t1171 = load i64, ptr %local.tc.935
  %t1172 = load i64, ptr %local.wa.938
  %t1173 = load i64, ptr %local.wb.939
  %t1174 = load i64, ptr %local.wc.940
  %t1175 = load i64, ptr %local.ab.941
  %t1176 = load i64, ptr %local.ac.942
  %t1177 = load i64, ptr %local.ba.943
  %t1178 = load i64, ptr %local.bc.944
  %t1179 = load i64, ptr %local.ca.945
  %t1180 = load i64, ptr %local.cb.946
  %t1181 = load i64, ptr %local.n.932
  %t1182 = load i64, ptr %local.inner.950
  %t1183 = load i64, ptr %local.lr.951
  %t1184 = call i64 @"mg_adv"(i64 %t1169, i64 %t1170, i64 %t1171, i64 %t1172, i64 %t1173, i64 %t1174, i64 %t1175, i64 %t1176, i64 %t1177, i64 %t1178, i64 %t1179, i64 %t1180, i64 3, i64 %t1181, i64 %t1182, i64 %t1183)
  store i64 %t1184, ptr %local.mg.947
  %t1185 = load i64, ptr %local.bc.944
  %t1186 = load i64, ptr %local.mlr.952
  %t1187 = load i64, ptr %local.mg.947
  %t1188 = call i64 @"sx_f64_mul"(i64 %t1186, i64 %t1187)
  %t1189 = call i64 @"sx_f64_sub"(i64 %t1185, i64 %t1188)
  %t1190 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.90)
  %t1191 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.91)
  %t1192 = call i64 @"clamp"(i64 %t1189, i64 %t1190, i64 %t1191)
  store i64 %t1192, ptr %local.bc.944
  %t1193 = load i64, ptr %local.ta.933
  %t1194 = load i64, ptr %local.tb.934
  %t1195 = load i64, ptr %local.tc.935
  %t1196 = load i64, ptr %local.wa.938
  %t1197 = load i64, ptr %local.wb.939
  %t1198 = load i64, ptr %local.wc.940
  %t1199 = load i64, ptr %local.ab.941
  %t1200 = load i64, ptr %local.ac.942
  %t1201 = load i64, ptr %local.ba.943
  %t1202 = load i64, ptr %local.bc.944
  %t1203 = load i64, ptr %local.ca.945
  %t1204 = load i64, ptr %local.cb.946
  %t1205 = load i64, ptr %local.n.932
  %t1206 = load i64, ptr %local.inner.950
  %t1207 = load i64, ptr %local.lr.951
  %t1208 = call i64 @"mg_adv"(i64 %t1193, i64 %t1194, i64 %t1195, i64 %t1196, i64 %t1197, i64 %t1198, i64 %t1199, i64 %t1200, i64 %t1201, i64 %t1202, i64 %t1203, i64 %t1204, i64 4, i64 %t1205, i64 %t1206, i64 %t1207)
  store i64 %t1208, ptr %local.mg.947
  %t1209 = load i64, ptr %local.ca.945
  %t1210 = load i64, ptr %local.mlr.952
  %t1211 = load i64, ptr %local.mg.947
  %t1212 = call i64 @"sx_f64_mul"(i64 %t1210, i64 %t1211)
  %t1213 = call i64 @"sx_f64_sub"(i64 %t1209, i64 %t1212)
  %t1214 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.92)
  %t1215 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.93)
  %t1216 = call i64 @"clamp"(i64 %t1213, i64 %t1214, i64 %t1215)
  store i64 %t1216, ptr %local.ca.945
  %t1217 = load i64, ptr %local.ta.933
  %t1218 = load i64, ptr %local.tb.934
  %t1219 = load i64, ptr %local.tc.935
  %t1220 = load i64, ptr %local.wa.938
  %t1221 = load i64, ptr %local.wb.939
  %t1222 = load i64, ptr %local.wc.940
  %t1223 = load i64, ptr %local.ab.941
  %t1224 = load i64, ptr %local.ac.942
  %t1225 = load i64, ptr %local.ba.943
  %t1226 = load i64, ptr %local.bc.944
  %t1227 = load i64, ptr %local.ca.945
  %t1228 = load i64, ptr %local.cb.946
  %t1229 = load i64, ptr %local.n.932
  %t1230 = load i64, ptr %local.inner.950
  %t1231 = load i64, ptr %local.lr.951
  %t1232 = call i64 @"mg_adv"(i64 %t1217, i64 %t1218, i64 %t1219, i64 %t1220, i64 %t1221, i64 %t1222, i64 %t1223, i64 %t1224, i64 %t1225, i64 %t1226, i64 %t1227, i64 %t1228, i64 5, i64 %t1229, i64 %t1230, i64 %t1231)
  store i64 %t1232, ptr %local.mg.947
  %t1233 = load i64, ptr %local.cb.946
  %t1234 = load i64, ptr %local.mlr.952
  %t1235 = load i64, ptr %local.mg.947
  %t1236 = call i64 @"sx_f64_mul"(i64 %t1234, i64 %t1235)
  %t1237 = call i64 @"sx_f64_sub"(i64 %t1233, i64 %t1236)
  %t1238 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.94)
  %t1239 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.95)
  %t1240 = call i64 @"clamp"(i64 %t1237, i64 %t1238, i64 %t1239)
  store i64 %t1240, ptr %local.cb.946
  %t1241 = load i64, ptr %local.cycle.948
  %t1242 = load i64, ptr %local.mcycles.953
  %t1243 = sub i64 %t1242, 1
  %t1244 = icmp eq i64 %t1241, %t1243
  %t1245 = zext i1 %t1244 to i64
  %t1246 = icmp ne i64 %t1245, 0
  br i1 %t1246, label %then34, label %else34
then34:
  %t1247 = load i64, ptr %local.ta.933
  %t1248 = load i64, ptr %local.tb.934
  %t1249 = load i64, ptr %local.tc.935
  %t1250 = load i64, ptr %local.wa.938
  %t1251 = load i64, ptr %local.wb.939
  %t1252 = load i64, ptr %local.wc.940
  %t1253 = load i64, ptr %local.ab.941
  %t1254 = load i64, ptr %local.ac.942
  %t1255 = load i64, ptr %local.ba.943
  %t1256 = load i64, ptr %local.bc.944
  %t1257 = load i64, ptr %local.ca.945
  %t1258 = load i64, ptr %local.cb.946
  %t1259 = load i64, ptr %local.n.932
  %t1260 = load i64, ptr %local.inner.950
  %t1261 = load i64, ptr %local.lr.951
  %t1262 = call i64 @"train_adversarial"(i64 %t1247, i64 %t1248, i64 %t1249, i64 %t1250, i64 %t1251, i64 %t1252, i64 %t1253, i64 %t1254, i64 %t1255, i64 %t1256, i64 %t1257, i64 %t1258, i64 %t1259, i64 %t1260, i64 %t1261)
  store i64 %t1262, ptr %local.loss.949
  %t1263 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.96)
  %t1264 = ptrtoint ptr %t1263 to i64
  %t1265 = inttoptr i64 %t1264 to ptr
  call void @intrinsic_print(ptr %t1265)
  %t1266 = load i64, ptr %local.loss.949
  %t1267 = call i64 @"print_f64"(i64 %t1266)
  %t1268 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.97)
  %t1269 = ptrtoint ptr %t1268 to i64
  %t1270 = inttoptr i64 %t1269 to ptr
  call void @intrinsic_print(ptr %t1270)
  %t1271 = load i64, ptr %local.ab.941
  %t1272 = call i64 @"print_f64"(i64 %t1271)
  %t1273 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.98)
  %t1274 = ptrtoint ptr %t1273 to i64
  %t1275 = inttoptr i64 %t1274 to ptr
  call void @intrinsic_print(ptr %t1275)
  %t1276 = load i64, ptr %local.ac.942
  %t1277 = call i64 @"print_f64"(i64 %t1276)
  %t1278 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.99)
  %t1279 = ptrtoint ptr %t1278 to i64
  %t1280 = inttoptr i64 %t1279 to ptr
  call void @intrinsic_print(ptr %t1280)
  %t1281 = load i64, ptr %local.ba.943
  %t1282 = call i64 @"print_f64"(i64 %t1281)
  %t1283 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.100)
  %t1284 = ptrtoint ptr %t1283 to i64
  %t1285 = inttoptr i64 %t1284 to ptr
  call void @intrinsic_print(ptr %t1285)
  %t1286 = load i64, ptr %local.bc.944
  %t1287 = call i64 @"print_f64"(i64 %t1286)
  %t1288 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.101)
  %t1289 = ptrtoint ptr %t1288 to i64
  %t1290 = inttoptr i64 %t1289 to ptr
  call void @intrinsic_print(ptr %t1290)
  %t1291 = load i64, ptr %local.ca.945
  %t1292 = call i64 @"print_f64"(i64 %t1291)
  %t1293 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.102)
  %t1294 = ptrtoint ptr %t1293 to i64
  %t1295 = inttoptr i64 %t1294 to ptr
  call void @intrinsic_print(ptr %t1295)
  %t1296 = load i64, ptr %local.cb.946
  %t1297 = call i64 @"print_f64"(i64 %t1296)
  %t1298 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.103)
  %t1299 = ptrtoint ptr %t1298 to i64
  %t1300 = inttoptr i64 %t1299 to ptr
  call void @intrinsic_println(ptr %t1300)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1301 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1302 = load i64, ptr %local.cycle.948
  %t1303 = add i64 %t1302, 1
  store i64 %t1303, ptr %local.cycle.948
  br label %loop33
endloop33:
  %t1304 = load i64, ptr %local.ta.933
  %t1305 = load i64, ptr %local.tb.934
  %t1306 = load i64, ptr %local.tc.935
  %t1307 = load i64, ptr %local.wa.938
  %t1308 = load i64, ptr %local.wb.939
  %t1309 = load i64, ptr %local.wc.940
  %t1310 = load i64, ptr %local.ab.941
  %t1311 = load i64, ptr %local.ac.942
  %t1312 = load i64, ptr %local.ba.943
  %t1313 = load i64, ptr %local.bc.944
  %t1314 = load i64, ptr %local.ca.945
  %t1315 = load i64, ptr %local.cb.946
  %t1316 = load i64, ptr %local.n.932
  %t1317 = load i64, ptr %local.inner.950
  %t1318 = load i64, ptr %local.lr.951
  %t1319 = call i64 @"train_adversarial"(i64 %t1304, i64 %t1305, i64 %t1306, i64 %t1307, i64 %t1308, i64 %t1309, i64 %t1310, i64 %t1311, i64 %t1312, i64 %t1313, i64 %t1314, i64 %t1315, i64 %t1316, i64 %t1317, i64 %t1318)
  store i64 %t1319, ptr %local.loss.949
  %t1320 = load i64, ptr %local.loss.949
  %t1321 = load i64, ptr %local.loss_none.954
  %t1322 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.104)
  %t1323 = call i64 @"sx_f64_add"(i64 %t1321, i64 %t1322)
  %t1324 = call i64 @"sx_f64_le"(i64 %t1320, i64 %t1323)
  %t1325 = icmp ne i64 %t1324, 0
  br i1 %t1325, label %then35, label %else35
then35:
  %t1326 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.105)
  %t1327 = ptrtoint ptr %t1326 to i64
  %t1328 = inttoptr i64 %t1327 to ptr
  call void @intrinsic_println(ptr %t1328)
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t1329 = load i64, ptr %local.loss.949
  %t1330 = load i64, ptr %local.loss_unif.955
  %t1331 = call i64 @"sx_f64_lt"(i64 %t1329, i64 %t1330)
  %t1332 = icmp ne i64 %t1331, 0
  br i1 %t1332, label %then36, label %else36
then36:
  %t1333 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.106)
  %t1334 = ptrtoint ptr %t1333 to i64
  %t1335 = inttoptr i64 %t1334 to ptr
  call void @intrinsic_println(ptr %t1335)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t1336 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.107)
  %t1337 = ptrtoint ptr %t1336 to i64
  %t1338 = inttoptr i64 %t1337 to ptr
  call void @intrinsic_println(ptr %t1338)
  %t1339 = load i64, ptr %local.failures.931
  %t1340 = add i64 %t1339, 1
  store i64 %t1340, ptr %local.failures.931
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1341 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1342 = phi i64 [ 0, %then35_end ], [ %t1341, %else35_end ]
  %t1343 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.108)
  %t1344 = ptrtoint ptr %t1343 to i64
  %t1345 = inttoptr i64 %t1344 to ptr
  call void @intrinsic_println(ptr %t1345)
  %t1346 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.109)
  %t1347 = ptrtoint ptr %t1346 to i64
  %t1348 = inttoptr i64 %t1347 to ptr
  call void @intrinsic_println(ptr %t1348)
  %t1349 = load i64, ptr %local.n.932
  %t1350 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.110)
  %t1351 = call i64 @"vec_fill"(i64 %t1349, i64 %t1350)
  store i64 %t1351, ptr %local.a_tgt.956
  %t1352 = load i64, ptr %local.n.932
  %t1353 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.111)
  %t1354 = call i64 @"vec_fill"(i64 %t1352, i64 %t1353)
  store i64 %t1354, ptr %local.b_tgt.957
  %t1355 = load i64, ptr %local.n.932
  %t1356 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.112)
  %t1357 = call i64 @"vec_fill"(i64 %t1355, i64 %t1356)
  store i64 %t1357, ptr %local.c_tgt.958
  store i64 0, ptr %local.j.959
  br label %loop37
loop37:
  %t1358 = load i64, ptr %local.j.959
  %t1359 = load i64, ptr %local.n.932
  %t1360 = icmp slt i64 %t1358, %t1359
  %t1361 = zext i1 %t1360 to i64
  %t1362 = icmp ne i64 %t1361, 0
  br i1 %t1362, label %body37, label %endloop37
body37:
  %t1363 = load i64, ptr %local.j.959
  %t1364 = call i64 @"sx_int_to_f64"(i64 %t1363)
  store i64 %t1364, ptr %local.fj.960
  %t1365 = load i64, ptr %local.a_tgt.956
  %t1366 = load i64, ptr %local.j.959
  %t1367 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.113)
  %t1368 = load i64, ptr %local.fj.960
  %t1369 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.114)
  %t1370 = call i64 @"sx_f64_mul"(i64 %t1368, i64 %t1369)
  %t1371 = call i64 @"sx_f64_add"(i64 %t1367, i64 %t1370)
  %t1372 = call i64 @"vset"(i64 %t1365, i64 %t1366, i64 %t1371)
  %t1373 = load i64, ptr %local.b_tgt.957
  %t1374 = load i64, ptr %local.j.959
  %t1375 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.115)
  %t1376 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.116)
  %t1377 = call i64 @"sx_f64_sub"(i64 %t1375, i64 %t1376)
  %t1378 = load i64, ptr %local.fj.960
  %t1379 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.117)
  %t1380 = call i64 @"sx_f64_mul"(i64 %t1378, i64 %t1379)
  %t1381 = call i64 @"sx_f64_sub"(i64 %t1377, i64 %t1380)
  %t1382 = call i64 @"vset"(i64 %t1373, i64 %t1374, i64 %t1381)
  %t1383 = load i64, ptr %local.c_tgt.958
  %t1384 = load i64, ptr %local.j.959
  %t1385 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.118)
  %t1386 = load i64, ptr %local.fj.960
  %t1387 = call i64 @"sin_f64"(i64 %t1386)
  %t1388 = call i64 @"sx_f64_mul"(i64 %t1385, i64 %t1387)
  %t1389 = call i64 @"vset"(i64 %t1383, i64 %t1384, i64 %t1388)
  %t1390 = load i64, ptr %local.j.959
  %t1391 = add i64 %t1390, 1
  store i64 %t1391, ptr %local.j.959
  br label %loop37
endloop37:
  %t1392 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.119)
  store i64 %t1392, ptr %local.a2_ab.961
  %t1393 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.120)
  store i64 %t1393, ptr %local.a2_ac.962
  %t1394 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.121)
  store i64 %t1394, ptr %local.a2_ba.963
  %t1395 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.122)
  store i64 %t1395, ptr %local.a2_bc.964
  %t1396 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.123)
  store i64 %t1396, ptr %local.a2_ca.965
  %t1397 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.124)
  store i64 %t1397, ptr %local.a2_cb.966
  store i64 300, ptr %local.ack_inner.967
  %t1398 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.125)
  store i64 %t1398, ptr %local.ack_lr.968
  %t1399 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.126)
  store i64 %t1399, ptr %local.ack_mlr.969
  %t1400 = load i64, ptr %local.a_tgt.956
  %t1401 = load i64, ptr %local.b_tgt.957
  %t1402 = load i64, ptr %local.c_tgt.958
  %t1403 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.127)
  %t1404 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.128)
  %t1405 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.129)
  %t1406 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.130)
  %t1407 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.131)
  %t1408 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.132)
  %t1409 = load i64, ptr %local.n.932
  %t1410 = load i64, ptr %local.ack_inner.967
  %t1411 = load i64, ptr %local.ack_lr.968
  %t1412 = call i64 @"train_ackley"(i64 %t1400, i64 %t1401, i64 %t1402, i64 %t1403, i64 %t1404, i64 %t1405, i64 %t1406, i64 %t1407, i64 %t1408, i64 %t1409, i64 %t1410, i64 %t1411)
  store i64 %t1412, ptr %local.ack_none.970
  %t1413 = load i64, ptr %local.a_tgt.956
  %t1414 = load i64, ptr %local.b_tgt.957
  %t1415 = load i64, ptr %local.c_tgt.958
  %t1416 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.133)
  %t1417 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.134)
  %t1418 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.135)
  %t1419 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.136)
  %t1420 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.137)
  %t1421 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.138)
  %t1422 = load i64, ptr %local.n.932
  %t1423 = load i64, ptr %local.ack_inner.967
  %t1424 = load i64, ptr %local.ack_lr.968
  %t1425 = call i64 @"train_ackley"(i64 %t1413, i64 %t1414, i64 %t1415, i64 %t1416, i64 %t1417, i64 %t1418, i64 %t1419, i64 %t1420, i64 %t1421, i64 %t1422, i64 %t1423, i64 %t1424)
  store i64 %t1425, ptr %local.ack_unif.971
  %t1426 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.139)
  %t1427 = ptrtoint ptr %t1426 to i64
  %t1428 = inttoptr i64 %t1427 to ptr
  call void @intrinsic_print(ptr %t1428)
  %t1429 = load i64, ptr %local.ack_none.970
  %t1430 = call i64 @"print_f64"(i64 %t1429)
  %t1431 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.140)
  %t1432 = ptrtoint ptr %t1431 to i64
  %t1433 = inttoptr i64 %t1432 to ptr
  call void @intrinsic_print(ptr %t1433)
  %t1434 = load i64, ptr %local.ack_unif.971
  %t1435 = call i64 @"print_f64"(i64 %t1434)
  %t1436 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.141)
  %t1437 = ptrtoint ptr %t1436 to i64
  %t1438 = inttoptr i64 %t1437 to ptr
  call void @intrinsic_println(ptr %t1438)
  store i64 0, ptr %local.cycle.948
  br label %loop38
loop38:
  %t1439 = load i64, ptr %local.cycle.948
  %t1440 = icmp slt i64 %t1439, 50
  %t1441 = zext i1 %t1440 to i64
  %t1442 = icmp ne i64 %t1441, 0
  br i1 %t1442, label %body38, label %endloop38
body38:
  %t1443 = load i64, ptr %local.a_tgt.956
  %t1444 = load i64, ptr %local.b_tgt.957
  %t1445 = load i64, ptr %local.c_tgt.958
  %t1446 = load i64, ptr %local.a2_ab.961
  %t1447 = load i64, ptr %local.a2_ac.962
  %t1448 = load i64, ptr %local.a2_ba.963
  %t1449 = load i64, ptr %local.a2_bc.964
  %t1450 = load i64, ptr %local.a2_ca.965
  %t1451 = load i64, ptr %local.a2_cb.966
  %t1452 = load i64, ptr %local.n.932
  %t1453 = load i64, ptr %local.ack_inner.967
  %t1454 = load i64, ptr %local.ack_lr.968
  %t1455 = call i64 @"mg_ack"(i64 %t1443, i64 %t1444, i64 %t1445, i64 %t1446, i64 %t1447, i64 %t1448, i64 %t1449, i64 %t1450, i64 %t1451, i64 0, i64 %t1452, i64 %t1453, i64 %t1454)
  store i64 %t1455, ptr %local.mg.947
  %t1456 = load i64, ptr %local.a2_ab.961
  %t1457 = load i64, ptr %local.ack_mlr.969
  %t1458 = load i64, ptr %local.mg.947
  %t1459 = call i64 @"sx_f64_mul"(i64 %t1457, i64 %t1458)
  %t1460 = call i64 @"sx_f64_sub"(i64 %t1456, i64 %t1459)
  %t1461 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.142)
  %t1462 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.143)
  %t1463 = call i64 @"clamp"(i64 %t1460, i64 %t1461, i64 %t1462)
  store i64 %t1463, ptr %local.a2_ab.961
  %t1464 = load i64, ptr %local.a_tgt.956
  %t1465 = load i64, ptr %local.b_tgt.957
  %t1466 = load i64, ptr %local.c_tgt.958
  %t1467 = load i64, ptr %local.a2_ab.961
  %t1468 = load i64, ptr %local.a2_ac.962
  %t1469 = load i64, ptr %local.a2_ba.963
  %t1470 = load i64, ptr %local.a2_bc.964
  %t1471 = load i64, ptr %local.a2_ca.965
  %t1472 = load i64, ptr %local.a2_cb.966
  %t1473 = load i64, ptr %local.n.932
  %t1474 = load i64, ptr %local.ack_inner.967
  %t1475 = load i64, ptr %local.ack_lr.968
  %t1476 = call i64 @"mg_ack"(i64 %t1464, i64 %t1465, i64 %t1466, i64 %t1467, i64 %t1468, i64 %t1469, i64 %t1470, i64 %t1471, i64 %t1472, i64 1, i64 %t1473, i64 %t1474, i64 %t1475)
  store i64 %t1476, ptr %local.mg.947
  %t1477 = load i64, ptr %local.a2_ac.962
  %t1478 = load i64, ptr %local.ack_mlr.969
  %t1479 = load i64, ptr %local.mg.947
  %t1480 = call i64 @"sx_f64_mul"(i64 %t1478, i64 %t1479)
  %t1481 = call i64 @"sx_f64_sub"(i64 %t1477, i64 %t1480)
  %t1482 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.144)
  %t1483 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.145)
  %t1484 = call i64 @"clamp"(i64 %t1481, i64 %t1482, i64 %t1483)
  store i64 %t1484, ptr %local.a2_ac.962
  %t1485 = load i64, ptr %local.a_tgt.956
  %t1486 = load i64, ptr %local.b_tgt.957
  %t1487 = load i64, ptr %local.c_tgt.958
  %t1488 = load i64, ptr %local.a2_ab.961
  %t1489 = load i64, ptr %local.a2_ac.962
  %t1490 = load i64, ptr %local.a2_ba.963
  %t1491 = load i64, ptr %local.a2_bc.964
  %t1492 = load i64, ptr %local.a2_ca.965
  %t1493 = load i64, ptr %local.a2_cb.966
  %t1494 = load i64, ptr %local.n.932
  %t1495 = load i64, ptr %local.ack_inner.967
  %t1496 = load i64, ptr %local.ack_lr.968
  %t1497 = call i64 @"mg_ack"(i64 %t1485, i64 %t1486, i64 %t1487, i64 %t1488, i64 %t1489, i64 %t1490, i64 %t1491, i64 %t1492, i64 %t1493, i64 2, i64 %t1494, i64 %t1495, i64 %t1496)
  store i64 %t1497, ptr %local.mg.947
  %t1498 = load i64, ptr %local.a2_ba.963
  %t1499 = load i64, ptr %local.ack_mlr.969
  %t1500 = load i64, ptr %local.mg.947
  %t1501 = call i64 @"sx_f64_mul"(i64 %t1499, i64 %t1500)
  %t1502 = call i64 @"sx_f64_sub"(i64 %t1498, i64 %t1501)
  %t1503 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.146)
  %t1504 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.147)
  %t1505 = call i64 @"clamp"(i64 %t1502, i64 %t1503, i64 %t1504)
  store i64 %t1505, ptr %local.a2_ba.963
  %t1506 = load i64, ptr %local.a_tgt.956
  %t1507 = load i64, ptr %local.b_tgt.957
  %t1508 = load i64, ptr %local.c_tgt.958
  %t1509 = load i64, ptr %local.a2_ab.961
  %t1510 = load i64, ptr %local.a2_ac.962
  %t1511 = load i64, ptr %local.a2_ba.963
  %t1512 = load i64, ptr %local.a2_bc.964
  %t1513 = load i64, ptr %local.a2_ca.965
  %t1514 = load i64, ptr %local.a2_cb.966
  %t1515 = load i64, ptr %local.n.932
  %t1516 = load i64, ptr %local.ack_inner.967
  %t1517 = load i64, ptr %local.ack_lr.968
  %t1518 = call i64 @"mg_ack"(i64 %t1506, i64 %t1507, i64 %t1508, i64 %t1509, i64 %t1510, i64 %t1511, i64 %t1512, i64 %t1513, i64 %t1514, i64 3, i64 %t1515, i64 %t1516, i64 %t1517)
  store i64 %t1518, ptr %local.mg.947
  %t1519 = load i64, ptr %local.a2_bc.964
  %t1520 = load i64, ptr %local.ack_mlr.969
  %t1521 = load i64, ptr %local.mg.947
  %t1522 = call i64 @"sx_f64_mul"(i64 %t1520, i64 %t1521)
  %t1523 = call i64 @"sx_f64_sub"(i64 %t1519, i64 %t1522)
  %t1524 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.148)
  %t1525 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.149)
  %t1526 = call i64 @"clamp"(i64 %t1523, i64 %t1524, i64 %t1525)
  store i64 %t1526, ptr %local.a2_bc.964
  %t1527 = load i64, ptr %local.a_tgt.956
  %t1528 = load i64, ptr %local.b_tgt.957
  %t1529 = load i64, ptr %local.c_tgt.958
  %t1530 = load i64, ptr %local.a2_ab.961
  %t1531 = load i64, ptr %local.a2_ac.962
  %t1532 = load i64, ptr %local.a2_ba.963
  %t1533 = load i64, ptr %local.a2_bc.964
  %t1534 = load i64, ptr %local.a2_ca.965
  %t1535 = load i64, ptr %local.a2_cb.966
  %t1536 = load i64, ptr %local.n.932
  %t1537 = load i64, ptr %local.ack_inner.967
  %t1538 = load i64, ptr %local.ack_lr.968
  %t1539 = call i64 @"mg_ack"(i64 %t1527, i64 %t1528, i64 %t1529, i64 %t1530, i64 %t1531, i64 %t1532, i64 %t1533, i64 %t1534, i64 %t1535, i64 4, i64 %t1536, i64 %t1537, i64 %t1538)
  store i64 %t1539, ptr %local.mg.947
  %t1540 = load i64, ptr %local.a2_ca.965
  %t1541 = load i64, ptr %local.ack_mlr.969
  %t1542 = load i64, ptr %local.mg.947
  %t1543 = call i64 @"sx_f64_mul"(i64 %t1541, i64 %t1542)
  %t1544 = call i64 @"sx_f64_sub"(i64 %t1540, i64 %t1543)
  %t1545 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.150)
  %t1546 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.151)
  %t1547 = call i64 @"clamp"(i64 %t1544, i64 %t1545, i64 %t1546)
  store i64 %t1547, ptr %local.a2_ca.965
  %t1548 = load i64, ptr %local.a_tgt.956
  %t1549 = load i64, ptr %local.b_tgt.957
  %t1550 = load i64, ptr %local.c_tgt.958
  %t1551 = load i64, ptr %local.a2_ab.961
  %t1552 = load i64, ptr %local.a2_ac.962
  %t1553 = load i64, ptr %local.a2_ba.963
  %t1554 = load i64, ptr %local.a2_bc.964
  %t1555 = load i64, ptr %local.a2_ca.965
  %t1556 = load i64, ptr %local.a2_cb.966
  %t1557 = load i64, ptr %local.n.932
  %t1558 = load i64, ptr %local.ack_inner.967
  %t1559 = load i64, ptr %local.ack_lr.968
  %t1560 = call i64 @"mg_ack"(i64 %t1548, i64 %t1549, i64 %t1550, i64 %t1551, i64 %t1552, i64 %t1553, i64 %t1554, i64 %t1555, i64 %t1556, i64 5, i64 %t1557, i64 %t1558, i64 %t1559)
  store i64 %t1560, ptr %local.mg.947
  %t1561 = load i64, ptr %local.a2_cb.966
  %t1562 = load i64, ptr %local.ack_mlr.969
  %t1563 = load i64, ptr %local.mg.947
  %t1564 = call i64 @"sx_f64_mul"(i64 %t1562, i64 %t1563)
  %t1565 = call i64 @"sx_f64_sub"(i64 %t1561, i64 %t1564)
  %t1566 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.152)
  %t1567 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.153)
  %t1568 = call i64 @"clamp"(i64 %t1565, i64 %t1566, i64 %t1567)
  store i64 %t1568, ptr %local.a2_cb.966
  %t1569 = load i64, ptr %local.cycle.948
  %t1570 = add i64 %t1569, 1
  store i64 %t1570, ptr %local.cycle.948
  br label %loop38
endloop38:
  %t1571 = load i64, ptr %local.a_tgt.956
  %t1572 = load i64, ptr %local.b_tgt.957
  %t1573 = load i64, ptr %local.c_tgt.958
  %t1574 = load i64, ptr %local.a2_ab.961
  %t1575 = load i64, ptr %local.a2_ac.962
  %t1576 = load i64, ptr %local.a2_ba.963
  %t1577 = load i64, ptr %local.a2_bc.964
  %t1578 = load i64, ptr %local.a2_ca.965
  %t1579 = load i64, ptr %local.a2_cb.966
  %t1580 = load i64, ptr %local.n.932
  %t1581 = load i64, ptr %local.ack_inner.967
  %t1582 = load i64, ptr %local.ack_lr.968
  %t1583 = call i64 @"train_ackley"(i64 %t1571, i64 %t1572, i64 %t1573, i64 %t1574, i64 %t1575, i64 %t1576, i64 %t1577, i64 %t1578, i64 %t1579, i64 %t1580, i64 %t1581, i64 %t1582)
  store i64 %t1583, ptr %local.ack_learned.972
  %t1584 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.154)
  %t1585 = ptrtoint ptr %t1584 to i64
  %t1586 = inttoptr i64 %t1585 to ptr
  call void @intrinsic_print(ptr %t1586)
  %t1587 = load i64, ptr %local.ack_learned.972
  %t1588 = call i64 @"print_f64"(i64 %t1587)
  %t1589 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.155)
  %t1590 = ptrtoint ptr %t1589 to i64
  %t1591 = inttoptr i64 %t1590 to ptr
  call void @intrinsic_print(ptr %t1591)
  %t1592 = load i64, ptr %local.a2_ab.961
  %t1593 = call i64 @"print_f64"(i64 %t1592)
  %t1594 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.156)
  %t1595 = ptrtoint ptr %t1594 to i64
  %t1596 = inttoptr i64 %t1595 to ptr
  call void @intrinsic_print(ptr %t1596)
  %t1597 = load i64, ptr %local.a2_ac.962
  %t1598 = call i64 @"print_f64"(i64 %t1597)
  %t1599 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.157)
  %t1600 = ptrtoint ptr %t1599 to i64
  %t1601 = inttoptr i64 %t1600 to ptr
  call void @intrinsic_print(ptr %t1601)
  %t1602 = load i64, ptr %local.a2_ba.963
  %t1603 = call i64 @"print_f64"(i64 %t1602)
  %t1604 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.158)
  %t1605 = ptrtoint ptr %t1604 to i64
  %t1606 = inttoptr i64 %t1605 to ptr
  call void @intrinsic_print(ptr %t1606)
  %t1607 = load i64, ptr %local.a2_bc.964
  %t1608 = call i64 @"print_f64"(i64 %t1607)
  %t1609 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.159)
  %t1610 = ptrtoint ptr %t1609 to i64
  %t1611 = inttoptr i64 %t1610 to ptr
  call void @intrinsic_print(ptr %t1611)
  %t1612 = load i64, ptr %local.a2_ca.965
  %t1613 = call i64 @"print_f64"(i64 %t1612)
  %t1614 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.160)
  %t1615 = ptrtoint ptr %t1614 to i64
  %t1616 = inttoptr i64 %t1615 to ptr
  call void @intrinsic_print(ptr %t1616)
  %t1617 = load i64, ptr %local.a2_cb.966
  %t1618 = call i64 @"print_f64"(i64 %t1617)
  %t1619 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.161)
  %t1620 = ptrtoint ptr %t1619 to i64
  %t1621 = inttoptr i64 %t1620 to ptr
  call void @intrinsic_println(ptr %t1621)
  %t1622 = load i64, ptr %local.ack_learned.972
  %t1623 = load i64, ptr %local.ack_none.970
  %t1624 = call i64 @f64_parse(ptr @.str.exp_stress_adversarial.162)
  %t1625 = call i64 @"sx_f64_add"(i64 %t1623, i64 %t1624)
  %t1626 = call i64 @"sx_f64_le"(i64 %t1622, i64 %t1625)
  %t1627 = icmp ne i64 %t1626, 0
  br i1 %t1627, label %then39, label %else39
then39:
  %t1628 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.163)
  %t1629 = ptrtoint ptr %t1628 to i64
  %t1630 = inttoptr i64 %t1629 to ptr
  call void @intrinsic_println(ptr %t1630)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  %t1631 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.164)
  %t1632 = ptrtoint ptr %t1631 to i64
  %t1633 = inttoptr i64 %t1632 to ptr
  call void @intrinsic_println(ptr %t1633)
  %t1634 = load i64, ptr %local.failures.931
  %t1635 = add i64 %t1634, 1
  store i64 %t1635, ptr %local.failures.931
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1636 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1637 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.165)
  %t1638 = ptrtoint ptr %t1637 to i64
  %t1639 = inttoptr i64 %t1638 to ptr
  call void @intrinsic_println(ptr %t1639)
  %t1640 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.166)
  %t1641 = ptrtoint ptr %t1640 to i64
  %t1642 = inttoptr i64 %t1641 to ptr
  call void @intrinsic_println(ptr %t1642)
  %t1643 = load i64, ptr %local.failures.931
  %t1644 = icmp eq i64 %t1643, 0
  %t1645 = zext i1 %t1644 to i64
  %t1646 = icmp ne i64 %t1645, 0
  br i1 %t1646, label %then40, label %else40
then40:
  %t1647 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.167)
  %t1648 = ptrtoint ptr %t1647 to i64
  %t1649 = inttoptr i64 %t1648 to ptr
  call void @intrinsic_println(ptr %t1649)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  %t1650 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.168)
  %t1651 = ptrtoint ptr %t1650 to i64
  %t1652 = inttoptr i64 %t1651 to ptr
  call void @intrinsic_print(ptr %t1652)
  %t1653 = load i64, ptr %local.failures.931
  call void @print_i64(i64 %t1653)
  %t1654 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.169)
  %t1655 = ptrtoint ptr %t1654 to i64
  %t1656 = inttoptr i64 %t1655 to ptr
  call void @intrinsic_println(ptr %t1656)
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1657 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1658 = call ptr @intrinsic_string_new(ptr @.str.exp_stress_adversarial.170)
  %t1659 = ptrtoint ptr %t1658 to i64
  %t1660 = inttoptr i64 %t1659 to ptr
  call void @intrinsic_println(ptr %t1660)
  %t1661 = load i64, ptr %local.failures.931
  ret i64 %t1661
}


; String constants
@.str.exp_stress_adversarial.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.3 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_stress_adversarial.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.7 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_stress_adversarial.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.12 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_stress_adversarial.13 = private unnamed_addr constant [17 x i8] c"2.71828182845905\00"
@.str.exp_stress_adversarial.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.18 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_stress_adversarial.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.20 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_stress_adversarial.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.22 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_stress_adversarial.23 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_stress_adversarial.24 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.30 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stress_adversarial.31 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stress_adversarial.32 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stress_adversarial.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.34 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stress_adversarial.35 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stress_adversarial.36 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_stress_adversarial.37 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_stress_adversarial.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.39 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_stress_adversarial.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.41 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_stress_adversarial.42 = private unnamed_addr constant [26 x i8] c"  ADVERSARIAL STRESS TEST\00"
@.str.exp_stress_adversarial.43 = private unnamed_addr constant [40 x i8] c"  Maximally conflicting objectives (8D)\00"
@.str.exp_stress_adversarial.44 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_stress_adversarial.45 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stress_adversarial.46 = private unnamed_addr constant [54 x i8] c"--- Test 1: Anti-parallel (A=+5, B=-5, C=0 steep) ---\00"
@.str.exp_stress_adversarial.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.49 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.50 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_stress_adversarial.51 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.54 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_stress_adversarial.55 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.56 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.57 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.58 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_stress_adversarial.59 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.60 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.61 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.62 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.63 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.64 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.65 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.66 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.67 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_stress_adversarial.68 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_stress_adversarial.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.75 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.76 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.77 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.78 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.79 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.80 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.81 = private unnamed_addr constant [11 x i8] c"  no_proj=\00"
@.str.exp_stress_adversarial.82 = private unnamed_addr constant [11 x i8] c"  uniform=\00"
@.str.exp_stress_adversarial.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stress_adversarial.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.85 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.87 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.89 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.92 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.93 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.95 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.96 = private unnamed_addr constant [11 x i8] c"  learned=\00"
@.str.exp_stress_adversarial.97 = private unnamed_addr constant [11 x i8] c"  alphas=[\00"
@.str.exp_stress_adversarial.98 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.99 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.100 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.101 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.102 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.103 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.exp_stress_adversarial.104 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.105 = private unnamed_addr constant [50 x i8] c"  PASS: Learned matrix competitive with baselines\00"
@.str.exp_stress_adversarial.106 = private unnamed_addr constant [51 x i8] c"  PARTIAL: Better than uniform, worse than no-proj\00"
@.str.exp_stress_adversarial.107 = private unnamed_addr constant [7 x i8] c"  FAIL\00"
@.str.exp_stress_adversarial.108 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stress_adversarial.109 = private unnamed_addr constant [52 x i8] c"--- Test 2: Ackley (flat outer + deep hole, 8D) ---\00"
@.str.exp_stress_adversarial.110 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.111 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.112 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.113 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.114 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_stress_adversarial.115 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.116 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.117 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_stress_adversarial.118 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.119 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.120 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.121 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.122 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.123 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.124 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.125 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_stress_adversarial.126 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_stress_adversarial.127 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.129 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.131 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.132 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.133 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.134 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.135 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.136 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.137 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.138 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_stress_adversarial.139 = private unnamed_addr constant [11 x i8] c"  no_proj=\00"
@.str.exp_stress_adversarial.140 = private unnamed_addr constant [11 x i8] c"  uniform=\00"
@.str.exp_stress_adversarial.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stress_adversarial.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.143 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.145 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.147 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.149 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.150 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.151 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.152 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_stress_adversarial.153 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_stress_adversarial.154 = private unnamed_addr constant [11 x i8] c"  learned=\00"
@.str.exp_stress_adversarial.155 = private unnamed_addr constant [11 x i8] c"  alphas=[\00"
@.str.exp_stress_adversarial.156 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.157 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.158 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.159 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.160 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_stress_adversarial.161 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.exp_stress_adversarial.162 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_stress_adversarial.163 = private unnamed_addr constant [42 x i8] c"  PASS: Learned Ackley matrix competitive\00"
@.str.exp_stress_adversarial.164 = private unnamed_addr constant [29 x i8] c"  FAIL: Learned matrix worse\00"
@.str.exp_stress_adversarial.165 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_stress_adversarial.166 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_stress_adversarial.167 = private unnamed_addr constant [31 x i8] c"  ALL ADVERSARIAL TESTS PASSED\00"
@.str.exp_stress_adversarial.168 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_stress_adversarial.169 = private unnamed_addr constant [28 x i8] c" ADVERSARIAL TEST(S) FAILED\00"
@.str.exp_stress_adversarial.170 = private unnamed_addr constant [45 x i8] c"============================================\00"
